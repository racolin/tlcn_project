import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../../models/local/token.dart';
import '../../supports/constant.dart';
import '../cache/cache.dart';
import 'app_config.dart';

class Api {
  Api() {
    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
        ),
      );
    }
  }

  /// Credential info
  Token? token;

  /// Get base url by env
  String apiBaseUrl() {
    return AppConfig.appConfig.env.resource +
        AppConfig.appConfig.env.apiBaseUrl;
  }

  String getFullImageUrl(String? id) {
    return id == null || id == '' ? productDefault : resource + AppConfig.appConfig.env.baseImage + id;
  }

  final String resource =
      AppConfig.appConfig.env.resource + AppConfig.appConfig.env.apiBaseUrl;

  final Dio dio = Dio();

  /// Get request header options
  Future<Options> getOptions(
      {String contentType = Headers.jsonContentType, String? prefer}) async {
    final Map<String, String> header = <String, String>{
      Headers.acceptHeader: "application/json",
      Headers.contentTypeHeader: "application/json; charset=utf-8",
      "Prefer": prefer ?? ""
    };
    return Options(headers: header, contentType: contentType);
  }

  /// Get auth header options
  Future<Options> getAuthOptions(
    BuildContext context, {
    String contentType = Headers.jsonContentType,
    String? acceptHeader,
    String? prefer = "",
  }) async {
    final Options options = await getOptions(
      contentType: contentType,
      prefer: prefer,
    );
    // Token? token = context.read<Credential>().token;
    // if (token != null) {
    //   final int expired = token.expiresIn;
    //   DateTime? dateToken = context.read<Credential>().dateGetToken;
    //   if (dateToken != null) {
    //     if (DateTime.now().isAfter(dateToken.add(Duration(seconds: expired)))) {
    //       var a = await Provider.of<AuthProvider>(context, listen: false)
    //           .refreshToken(context, token.accessToken);
    //       if (a) {
    //         token = context.read<Credential>().token;
    //       }
    //     }
    //   }
    //
    //   options.headers?.addAll(
    //       <String, String>{'Authorization': 'Bearer ${token!.accessToken}'});
    // }

    String accessToken  = await context.read<Cache>().getData('access_token');
    options.headers?.addAll(
        <String, String>{'Authorization': 'Bearer $accessToken'});

    return options;
  }

  /// Wrap Dio Exception
  Future<Response<T>> wrapE<T>(
      Future<Response<T>> Function() dioApi, BuildContext? context) async {
    try {
      return await dioApi();
    } catch (error) {
      if (error is DioError && error.type == DioErrorType.response) {
        final Response<dynamic>? response = error.response;
        if (response != null) {
          if (response.statusCode == 401) {
            try {
              // var a = await Provider.of<AuthProvider>(context!, listen: false).loginLib();
              // if(a){
              //   RequestOptions requestOptions=response.requestOptions;
              //   final Token? token = context.read<Credential>().token;
              //   if (token != null) {
              //     final Options options = await getOptions(contentType:  Headers.jsonContentType);
              //     options.headers!.addAll(<String, String>{'Authorization': 'Bearer ${token.accessToken}'});
              //     return dio.request(requestOptions.path,options: options);
              //   }
              // }
            } catch (error) {
              if (error is DioError && error.type == DioErrorType.response) {
                final Response<dynamic>? response = error.response;
                final String errorMessage =
                    'Code ${response?.statusCode} - ${response?.statusMessage} ${response?.data != null ? '\n' : ''} ${response?.data}';
                throw DioError(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    type: error.type,
                    error: errorMessage);
              } else if (error is DioError &&
                  error.type == DioErrorType.other) {
                throw DioError(
                    requestOptions: error.requestOptions,
                    response: error.response,
                    type: error.type,
                    error: error.error.osError.message);
              } else {
                rethrow;
              }
            }
          }
          try {
            /// By pass dio header error code to get response content
            /// Try to return response
            final Response<T> res = Response<T>(
              data: response.data as T,
              headers: response.headers,
              requestOptions: response.requestOptions,
              isRedirect: response.isRedirect,
              statusCode: response.statusCode,
              statusMessage: response.statusMessage,
              redirects: response.redirects,
              extra: response.extra,
            );
            return res;
          } catch (e) {
            print(e);
          }
        }
        final String errorMessage =
            'Code ${response?.statusCode} - ${response?.statusMessage} ${response?.data != null ? '\n' : ''} ${response?.data}';
        throw DioError(
          requestOptions: error.requestOptions,
          response: error.response,
          type: error.type,
          error: errorMessage,
        );
      } else if (error is DioError && error.type == DioErrorType.other) {
        throw DioError(
          requestOptions: error.requestOptions,
          response: error.response,
          type: error.type,
          error: error.error.osError.message,
        );
      } else {
        rethrow;
      }
    }
  }

  Future<String?> httpGetImageBase(String imageUrl, context) async {
    final Options options = await getAuthOptions(
      context,
      contentType: Headers.jsonContentType,
      acceptHeader: "application/json",
    );

    var result = await wrapE(
      () => dio.get<Map<String, dynamic>>(
        imageUrl,
        options: options,
      ),
      context,
    ).timeout(const Duration(seconds: 30));

    Map<String, dynamic> a = result.data as Map<String, dynamic>;

    if (a["error"] != null) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: a["error"]["message"],
        type: DioErrorType.response,
      );
    }

    return result.data!["value"];
  }

  Future<dynamic> patchDio(String url, Map data, context) async {
    final Options options = await getAuthOptions(
      context,
      contentType: Headers.jsonContentType,
    );
    var result = await wrapE(
      () => dio.patch<Map<String, dynamic>>('$resource$url',
          options: options, data: data),
      context,
    ).timeout(const Duration(seconds: 30));
    if (result.statusCode == 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["errors"][0]["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 500) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 404) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
    return result.data;
  }

  Future<dynamic> getDio(String url, Map data, context) async {
    final Options options = await getAuthOptions(
      context,
      contentType: Headers.jsonContentType,
    );

    var result = await wrapE(
      () => dio.get<Map<String, dynamic>>(
        '$resource$url',
        options: options,
      ),
      context,
    ).timeout(const Duration(seconds: 30));

    if (result.statusCode == 200 || result.statusCode == 201) {
      return result.data;
    }

    if (result.statusCode! >= 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
  }

  Future<dynamic> postDio(String url, dynamic data, context) async {
    final Options options = await getAuthOptions(
      context,
      contentType: Headers.jsonContentType,
    );

    var result = await wrapE(
      () => dio.post(
        '$resource$url',
        data: data,
        options: options,
      ),
      context,
    ).timeout(const Duration(seconds: 30));
    if (result.statusCode == 200) {
      if (result.data!["message"]["type"] != 0) {
        throw DioError(
          requestOptions: RequestOptions(path: ""),
          error: result.data!["message"]["message"].toString(),
          type: DioErrorType.response,
        );
      }
    } else if (result.statusCode == 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["errors"][0]["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 500) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 404) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
    return result.data;
  }

  Future<dynamic> putDio(String url, Map data, context) async {
    final Options options = await getAuthOptions(
      context,
      contentType: Headers.jsonContentType,
    );
    var result = await wrapE(
      () => dio.put<Map<String, dynamic>>(
        '$resource$url',
        data: data,
        options: options,
      ),
      context,
    ).timeout(const Duration(seconds: 30));
    if (result.statusCode == 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["errors"][0]["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 500) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 404) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
    return result.data;
  }

  Future<dynamic> deleteDio(String url, Map data, context) async {
    final Options options = await getAuthOptions(
      context,
      contentType: Headers.jsonContentType,
    );
    var result = await wrapE(
      () => dio.delete<Map<String, dynamic>>(
        '$resource$url',
        data: data,
        options: options,
      ),
      context,
    ).timeout(const Duration(seconds: 30));
    if (result.statusCode == 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["errors"][0]["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 500) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 404) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
    return result.data;
  }

  Future<dynamic> postFileDio(String url, dynamic data, context) async {
    final Options options = await getAuthOptions(
      context,
      contentType: "multipart/form-data",
    );
    var result = await wrapE(
      () => dio.post<Map<String, dynamic>>(
        '$resource$url',
        data: data,
        options: options,
      ),
      context,
    ).timeout(const Duration(seconds: 30));
    if (result.statusCode == 200) {
      if (result.data!["message"]["type"] != 0) {
        throw DioError(
          requestOptions: RequestOptions(path: ""),
          error: result.data!["message"]["message"].toString(),
          type: DioErrorType.response,
        );
      }
    } else if (result.statusCode == 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["errors"][0]["message"],
        type: DioErrorType.response,
      );
    } else if (result.statusCode == 500) {
      throw DioError(
          requestOptions: RequestOptions(path: ""),
          error: result.data!["message"],
          type: DioErrorType.response);
    } else if (result.statusCode == 404) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
    return result.data;
  }

  Future<dynamic> getDioNotAuthor(String url, Map data, context) async {
    final Options options = await getOptions(
      contentType: Headers.jsonContentType,
    );
    var result = await wrapE(
      () => dio.get<Map<String, dynamic>>(
        '$resource$url',
        options: options,
      ),
      context,
    ).timeout(const Duration(seconds: 30));

    if (result.statusCode == 200 || result.statusCode == 201) {
      return result.data;
    }

    if (result.statusCode! >= 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
  }

  Future<dynamic> postDioNotAuthor(String url, Map data, context) async {
    final Options options = await getOptions(
      contentType: Headers.jsonContentType,
    );
    var result = await wrapE(
      () => dio.post<Map<String, dynamic>>('$resource$url',
          options: options, data: data),
      context,
    ).timeout(const Duration(seconds: 30));

    if (result.statusCode == 200 || result.statusCode == 201) {
      return result.data;
    }

    if (result.statusCode! >= 400) {
      throw DioError(
        requestOptions: RequestOptions(path: ""),
        error: result.data!["message"],
        type: DioErrorType.response,
      );
    }
  }
}

class APIResponse<T> {
  T? data;
  bool error;
  String? errorMessage;

  APIResponse({
    this.data,
    this.errorMessage,
    this.error = false,
  });
}

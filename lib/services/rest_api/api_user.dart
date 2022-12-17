import 'package:dio/dio.dart';
import 'api.dart';

class ApiUser extends Api {
  Future<Map<String, dynamic>> logIn(String email, String password) async {
    final Options options = await getOptions();
    var result = await wrapE(
        () => dio.get<Map<String, dynamic>>(
            '${resource}account/dologin?uid=$email&pwd=$password',
            options: options),
        null);
    if (result.statusCode == 200) {
      if (result.data!["message"]["type"] != 0) {
        throw DioError(
            requestOptions: RequestOptions(path: ""),
            error: result.data!["message"]["message"].toString(),
            type: DioErrorType.response);
      }
    } else if (result.statusCode == 500) {
      throw DioError(
          requestOptions: RequestOptions(path: ""),
          error: result.data!["message"],
          type: DioErrorType.response);
    }
    return result.data!;
  }

  Future<Map<String, dynamic>> singUp(String email, String name, String phone,
      String password, String storeName) async {
    final Options options = await getOptions();
    var result = await wrapE(
        () => dio.post<Map<String, dynamic>>(
              '${resource}account/create-shopinfo-mobile',
              options: options,
              data: <String, String>{
                'Email': email,
                'Password': password,
                'StoreName': storeName,
                'UserNM': name,
                'PhoneNumber': phone,
              },
            ),
        null);
    if (result.statusCode == 200) {
      if (result.data!["message"]["type"] != 0) {
        throw DioError(
            requestOptions: RequestOptions(path: ""),
            error: result.data!["message"]["message"].toString(),
            type: DioErrorType.response);
      }
    } else if (result.statusCode == 500) {
      throw DioError(
          requestOptions: RequestOptions(path: ""),
          error: result.data!["message"],
          type: DioErrorType.response);
    }
    return result.data!;
  }
}

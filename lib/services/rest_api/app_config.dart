class Env {
  final String apiBaseUrl;
  final String resource;
  final String baseImage;

  Env._({
    required this.apiBaseUrl,
    required this.resource,
    required this.baseImage,
  });
  factory Env.dev() {
    return Env._(
      apiBaseUrl: 'api/v1/',
      resource: 'http://127.0.0.1:8080/',
      baseImage: 'file/render/',
    );
  }
}

// Config env
class AppConfig{
  factory AppConfig({Env? env}){

    if(env !=null){
      appConfig.env = env;
    }

    return appConfig;
  }
  AppConfig._private();
  static final AppConfig appConfig = AppConfig._private();
  Env env = Env.dev();
}

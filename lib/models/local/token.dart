class Token {
  Token({
    // required this.tokenType,
    // required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        // tokenType: json['token_type'] as String,
        // expiresIn: int.parse(json['expires_in'].toString()),
        accessToken: json['access_token'] as String,
        refreshToken: json['refresh_token'] as String,
      );

  static const String localKey = 'token';
  static const String tokenDate = 'tokenDate';
  static const String userName = 'userName';
  static const String passWord = 'passWord';
  static const String userId = 'userId';
  static const String fullName = 'fullName';

  // final String tokenType;
  // final int expiresIn;
  final String accessToken;
  final String refreshToken;

  Map<String, dynamic> toJson() => <String, dynamic>{
        // 'token_type': tokenType,
        // 'expires_in': expiresIn,
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };

  @override
  String toString() {
    return 'Token{accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}

class ModulePermission {
  ModulePermission(
      {this.moduleID,
      this.moduleNM,
      this.moduleUD,
      this.moduleNMEN,
      this.url,
      this.parentID,
      this.icon,
      this.navType,
      this.displayOrder,
      this.listModelChild});

  factory ModulePermission.fromJson(Map<String, dynamic> json) =>
      ModulePermission(
        moduleID: json['moduleID'] != null ? json['moduleID'].toString() : null,
        moduleUD: json['moduleUD'] != null ? json['moduleUD'].toString() : null,
        moduleNM: json['moduleNM'] != null ? json['moduleNM'].toString() : null,
        moduleNMEN:
            json['moduleNMEN'] != null ? json['moduleNMEN'].toString() : null,
        url: json['url'] != null ? json['url'].toString() : null,
        parentID: json['parentID'] != null ? json['parentID'].toString() : null,
        icon: json['icon'] != null
            ? json['icon'].toString()
            : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa2Hrz46g91ELDTi3MMF-C20iVmXmGCVArTA&usqp=CAU",
        navType: json['navType'] != null ? json['navType'].toString() : null,
        displayOrder: json['displayOrder'] != null
            ? json['displayOrder'].toString()
            : null,
        listModelChild: [],
      );

  final String? moduleID;
  final String? moduleUD;
  final String? moduleNM;
  final String? moduleNMEN;
  final String? url;
  final String? parentID;
  final String? icon;
  final String? navType;
  final String? displayOrder;
  List<ModulePermission>? listModelChild;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'moduleID': moduleID,
        'moduleUD': moduleUD,
        'moduleNM': moduleNM,
        'moduleNMEN': moduleNMEN,
        'url': url,
        'parentID': parentID,
        'icon': icon,
        'navType': navType,
        'displayOrder': displayOrder,
      };
}

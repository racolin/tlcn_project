import 'package:tlcn_project/services/rest_api/api.dart';

class MemberUtil {
  final String id;
  final String email;
  final String mobile;
  final String firstName;
  final String lastName;
  final String gender;
  final DateTime dob;
  final MemberInfoUtil memberInfo;
  final DateTime joinedAt;
  final DateTime updatedAt;

  MemberUtil({
    required this.id,
    required this.email,
    required this.mobile,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.memberInfo,
    required this.joinedAt,
    required this.updatedAt,
  });

  factory MemberUtil.fromJson(Map<String, dynamic> json) {
    return MemberUtil(
      id: json['_id'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      gender: json['gender'] ?? '',
      dob: json['dob'] == null
          ? DateTime.now()
          : DateTime.parse(json['dob']),
      memberInfo: MemberInfoUtil.fromJson(json['memberInfo'] ?? {}),
      joinedAt: json['joinedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['joinedAt']),
      updatedAt: json['updatedAt'] == null
          ? DateTime.now()
          : DateTime.parse(json['updatedAt']),
    );
  }

  factory MemberUtil.empty() {
    return MemberUtil.fromJson({});
  }
}

class MemberInfoUtil {
  final String code;
  final int usedPoint;
  final int expiredPoint;
  final int currentPoint;
  final RankUtil rank;

  MemberInfoUtil({
    required this.code,
    required this.usedPoint,
    required this.expiredPoint,
    required this.currentPoint,
    required this.rank,
  });

  factory MemberInfoUtil.fromJson(Map<String, dynamic> json) {
    return MemberInfoUtil(
      code: json['code'] ?? '',
      usedPoint: json['usedPoint'] ?? '',
      expiredPoint: json['expiredPoint'] ?? 0,
      currentPoint: json['currentPoint'] ?? 0,
      rank: json['rank'] == null
          ? RankUtil.empty()
          : RankUtil.fromJson(json['rank']),
    );
  }

  factory MemberInfoUtil.empty() {
    return MemberInfoUtil.fromJson({});
  }
}

class RankUtil {
  final String id;
  final String name;
  final int rank;
  final RankDisplayUtil display;
  final int condition;
  final int coefficientPoint;
  final List coupons;
  final List gifts;

  RankUtil({
    required this.id,
    required this.name,
    required this.rank,
    required this.display,
    required this.condition,
    required this.coefficientPoint,
    required this.coupons,
    required this.gifts,
  });

  factory RankUtil.fromJson(Map<String, dynamic> json) {
    return RankUtil(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      rank: json['rank'] ?? 0,
      display:  RankDisplayUtil.fromJson(json['display'] ?? {}),
      condition: json['condition'] ?? 0,
      coefficientPoint: json['coefficientPoint'] ?? 0,
      coupons: json['coupons'] ?? [],
      gifts: json['gifts'] ?? [],
    );
  }

  factory RankUtil.empty() {
    return RankUtil.fromJson({});
  }
}

class RankDisplayUtil {
  final String icon;
  final String color;
  final String background;

  RankDisplayUtil({
    required this.icon,
    required this.color,
    required this.background,
  });

  factory RankDisplayUtil.fromJson(Map<String, dynamic> json) {
    return RankDisplayUtil(
      icon: Api().getFullImageUrl(json['icon']),
      color: json['color'] ?? '',
      background: Api().getFullImageUrl(json['background']),
    );
  }

  factory RankDisplayUtil.empty() {
    return RankDisplayUtil.fromJson({});
  }
}

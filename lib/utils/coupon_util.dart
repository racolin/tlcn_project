import '../services/rest_api/api.dart';

class CouponUtil {
  final String id;
  final String title;
  final String code;
  final String image;
  final int amountApplyHour;
  final bool deleted;
  final int usedTime;
  final int ownedAmount;

  CouponUtil({
    required this.id,
    required this.title,
    required this.code,
    required this.image,
    required this.amountApplyHour,
    required this.deleted,
    required this.usedTime,
    required this.ownedAmount,
  });

  factory CouponUtil.fromJson(Map<String, dynamic> json) {
    return CouponUtil(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      code: json['code'] ?? '',
      image: Api().getFullImageUrl(json['image']),
      amountApplyHour: json['amountApplyHour'] ?? 0,
      deleted: json['deleted'] ?? false,
      usedTime: json['usedTime'] ?? 0,
      ownedAmount: json['ownedAmount'] ?? 0,
    );
  }
}

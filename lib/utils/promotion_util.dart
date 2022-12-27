import 'package:tlcn_project/utils/member_util.dart';

import 'order_util.dart';

class PromotionUtil {
  final String id;
  final String title;
  final CouponShortUtil coupon;
  final int cost;
  final bool opening;
  final bool deleted;
  final List<ApplyToUtil> applyTo;

  PromotionUtil({
    required this.id,
    required this.title,
    required this.coupon,
    required this.cost,
    required this.opening,
    required this.deleted,
    required this.applyTo,
  });

  factory PromotionUtil.fromJson(Map<String, dynamic> json) {
    return PromotionUtil(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      coupon: CouponShortUtil.fromJson(json['coupon'] ?? {}),
      cost: json['cost'] ?? 0,
      opening: json['opening'] ?? false,
      deleted: json['deleted'] ?? false,
      applyTo: json['applyTo'] == null
          ? []
          : (json['applyTo'] as List)
              .map((e) => ApplyToUtil.fromJson(e))
              .toList(),
    );
  }
}

class ApplyToUtil {
  final String id;
  final String name;
  final RankDisplayUtil display;
  final int sold;
  final int limit;

  factory ApplyToUtil.fromJson(Map<String, dynamic> json) {
    return ApplyToUtil(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      display: RankDisplayUtil.fromJson(json['display'] ?? {}),
      sold: json['sold'] ?? 0,
      limit: json['limit'] ?? 0,
    );
  }

  ApplyToUtil({
    required this.id,
    required this.name,
    required this.display,
    required this.sold,
    required this.limit,
  });
}

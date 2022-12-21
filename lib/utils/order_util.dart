import '../../utils/product_util.dart';

class OrderUtil {
  final List<OrderInfoUtil> orders;
  final List<OrderStatusUtil> status;

  OrderUtil({
    required this.orders,
    required this.status,
  });

  factory OrderUtil.fromJson(Map<String, dynamic> json) {
    return OrderUtil(
      orders: json['orders'] == null
          ? []
          : (json['orders'] as List)
              .map((e) => OrderInfoUtil.fromJson(e))
              .toList(),
      status: []
        // json['status'] == null
        //   ? []
        //   : (json['status'] as List)
        //       .map((e) => OrderStatusUtil.fromJson(e))
        //       .toList()
    ,
    );
  }

  factory OrderUtil.empty() {
    return OrderUtil.fromJson({});
  }
}

class OrderInfoUtil {
  final String id;
  final String type;
  final OrderMemberUtil member;
  final OrderCouponUtil coupon;
  final int earnedPoint;
  final String buyer;
  final OrderStoreUtil store;
  final List<OrderProductUtil> items;
  final int totalPrice;
  final String code;
  final String payment;
  final int paidAmount;
  final DateTime createdAt;

  OrderInfoUtil({
    required this.id,
    required this.type,
    required this.member,
    required this.coupon,
    required this.earnedPoint,
    required this.buyer,
    required this.store,
    required this.items,
    required this.totalPrice,
    required this.code,
    required this.payment,
    required this.paidAmount,
    required this.createdAt,
  });

  factory OrderInfoUtil.fromJson(Map<String, dynamic> json) {
    return OrderInfoUtil(
        id: json['_id'] ?? '',
        type: json['type'] ?? '',
        member: json['member'] == null
            ? OrderMemberUtil.empty()
            : OrderMemberUtil.fromJson(json['member']),
        coupon: json['coupon'] == null
            ? OrderCouponUtil.empty()
            : OrderCouponUtil.fromJson(json['coupon']),
        earnedPoint: json['earnedPoint'] ?? 0,
        buyer: json['buyer'] ?? '',
        store: json['store'] == null
            ? OrderStoreUtil.empty()
            : OrderStoreUtil.fromJson(json['store']),
        items: json['items'] == null
            ? []
            : (json['items'] as List)
                .map((e) => OrderProductUtil.fromJson(e))
                .toList(),
        totalPrice: json['totalPrice'] ?? 0,
        payment: json['payment'] ?? '',
        paidAmount: json['paidAmount'] ?? 0,
        code: json['code'] ?? '',
        createdAt: json['createdAt'] == null
            ? DateTime.now()
            : DateTime.parse(json['createdAt']));
  }

  factory OrderInfoUtil.empty() {
    return OrderInfoUtil.fromJson({});
  }
}

class OrderStoreUtil {
  final String id;
  final String name;
  final String address;

  OrderStoreUtil({
    required this.id,
    required this.name,
    required this.address,
  });

  factory OrderStoreUtil.fromJson(Map<String, dynamic> json) {
    return OrderStoreUtil(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
    );
  }

  factory OrderStoreUtil.empty() {
    return OrderStoreUtil.fromJson({});
  }
}

class OrderMemberUtil {
  final String id;
  final String name;
  final String email;
  final String mobile;

  OrderMemberUtil({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory OrderMemberUtil.fromJson(Map<String, dynamic> json) {
    return OrderMemberUtil(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
    );
  }

  factory OrderMemberUtil.empty() {
    return OrderMemberUtil.fromJson({});
  }
}

class OrderCouponUtil {
  final String id;
  final String title;
  final String code;
  final int discountAmount;

  OrderCouponUtil({
    required this.id,
    required this.title,
    required this.code,
    required this.discountAmount,
  });

  factory OrderCouponUtil.fromJson(Map<String, dynamic> json) {
    return OrderCouponUtil(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      code: json['code'] ?? '',
      discountAmount: json['discountAmount'] ?? 0,
    );
  }

  factory OrderCouponUtil.empty() {
    return OrderCouponUtil.fromJson({});
  }
}

class OrderStatusUtil {
  final String status;
  final String name;
  final DateTime? time;
  final bool checked;

  OrderStatusUtil({
    required this.status,
    required this.name,
    required this.time,
    required this.checked,
  });

  factory OrderStatusUtil.fromJson(Map<String, dynamic> json) {
    return OrderStatusUtil(
      status: json['status'] ?? '',
      name: json['name'] ?? '',
      time: json['time'] == null ? null : DateTime.tryParse(json['time']),
      checked: json['checked'] ?? false,
    );
  }

  factory OrderStatusUtil.empty() {
    return OrderStatusUtil.fromJson({});
  }
}

class OrderProductUtil {
  final String productId;
  final String name;
  final String categoryId;
  final int originalPrice;
  final List<ToppingUtil> toppings;
  final int amount;
  final int itemPrice;

  OrderProductUtil({
    required this.productId,
    required this.name,
    required this.categoryId,
    required this.originalPrice,
    required this.toppings,
    required this.amount,
    required this.itemPrice,
  });

  factory OrderProductUtil.fromJson(Map<String, dynamic> json) {
    return OrderProductUtil(
      productId: json['productId'] ?? '',
      name: json['name'] ?? '',
      categoryId: json['categoryId'] ?? '',
      originalPrice: json['originalPrice'] ?? '',
      toppings: json['toppings'] == null
          ? []
          : (json['toppings'] as List)
              .map((e) => ToppingUtil.fromJson(e))
              .toList(),
      amount: json['amount'] ?? 0,
      itemPrice: json['itemPrice'] ?? 0,
    );
  }

  factory OrderProductUtil.empty() {
    return OrderProductUtil.fromJson({});
  }
}

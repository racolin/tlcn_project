import 'package:tlcn_project/utils/member_util.dart';

import '../../models/product_model.dart';
import '../../models/rank_model.dart';
import '../utils/employee_util.dart';

class RowHeader {
  final List<String> headers;

  RowHeader(this.headers);
}

class ItemRow {
  int _columnCounts = 0;

  int get columnCounts => _columnCounts;
}

class ListRow<T extends ItemRow> {
  final List<int> rate;
  final RowHeader header;
  final List<T> rows;

  ListRow({
    required this.header,
    required this.rows,
    required this.rate,
  });

  bool isMatchColumn() {
    return rows.isEmpty
        ? true
        : (rows[0].columnCounts == header.headers.length) &&
            (header.headers.length == rate.length);
  }
}

// Member

enum MemberType { bronze, sliver, gold, diamond }

class MemberModel {
  final String id;
  final String image;
  final String name;
  final RankModel rank;
  final int totalPoint;
  final int usedPoint;
  final int currentPoint;
  final DateTime joinDate;
  final bool hide;

  MemberModel({
    required this.id,
    required this.image,
    required this.name,
    required this.rank,
    required this.totalPoint,
    required this.usedPoint,
    required this.currentPoint,
    required this.joinDate,
    required this.hide,
  });

  factory MemberModel.fromUtil(MemberUtil util) {
    return MemberModel(
      id: util.id,
      image: util.memberInfo.rank.display.icon,
      name: '${util.firstName} ${util.lastName}',
      rank: RankModel.fromUtil(util.memberInfo.rank),
      totalPoint: util.memberInfo.expiredPoint,
      usedPoint: util.memberInfo.usedPoint,
      currentPoint: util.memberInfo.currentPoint,
      joinDate: util.joinedAt,
      hide: false,
    );
  }
}

class MemberRow extends ItemRow {
  final MemberModel member;

  MemberRow(
    this.member,
  ) {
    _columnCounts = 8;
  }
}

//Employee

class EmployeeModel {
  final String id;
  final String image;
  final String name;
  final String username;
  final String email;
  final String role;
  final DateTime joinDate;
  final bool hide;

  EmployeeModel({
    required this.id,
    required this.image,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.joinDate,
    required this.hide,
  });

  factory EmployeeModel.fromUtil(EmployeeUtil util) {
    return EmployeeModel(
      id: util.id,
      image: util.image,
      name: util.name,
      username: util.username,
      email: util.email,
      role: util.role,
      joinDate: util.joinDate,
      hide: util.hide,
    );
  }
}

class EmployeeRow extends ItemRow {
  final EmployeeModel employee;

  EmployeeRow(
    this.employee,
  ) {
    _columnCounts = 7;
  }
}

//Coupon

class Coupon {
  final String id;
  final String code;
  final String title;
  final List<RankModel> applyTo;
  final int appliedTime;
  final String scope;
  final String type;
  final bool hide;

  Coupon({
    required this.id,
    required this.code,
    required this.title,
    required this.applyTo,
    required this.appliedTime,
    required this.scope,
    required this.type,
    required this.hide,
  });
}

class CouponRow extends ItemRow {
  final Coupon coupon;

  CouponRow({required this.coupon}) {
    _columnCounts = 8;
  }
}

//Promotion

class Promotion {
  final String id;
  final String partner;
  final String title;
  final List<RankModel> applyTo;
  final String coupon;
  final String cost;
  final String status;
  final bool hide;

  Promotion({
    required this.id,
    required this.partner,
    required this.title,
    required this.applyTo,
    required this.coupon,
    required this.cost,
    required this.status,
    required this.hide,
  });
}

class PromotionRow extends ItemRow {
  final Promotion promotion;

  PromotionRow({required this.promotion}) {
    _columnCounts = 8;
  }
}

class ProductRow extends ItemRow {
  final Product product;

  ProductRow({required this.product}) {
    _columnCounts = 7;
  }
}

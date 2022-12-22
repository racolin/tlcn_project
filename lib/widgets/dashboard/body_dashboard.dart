import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';
import 'package:tlcn_project/providers/dashboard_provider/employee_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/member_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/products_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_provider.dart';
import 'package:tlcn_project/widgets/dashboard/coupon/coupon_dashboard.dart';
import 'package:tlcn_project/widgets/dashboard/employee/employee_dashboard.dart';
import 'package:tlcn_project/widgets/dashboard/member/member_dashboard.dart';
import 'package:tlcn_project/widgets/dashboard/product/product_dashboard.dart';
import 'package:tlcn_project/widgets/dashboard/promotion/promotion_dashboard.dart';
import 'package:tlcn_project/widgets/dashboard/store/store_dashboard.dart';

class BodyDashBoard extends StatefulWidget {
  const BodyDashBoard({Key? key}) : super(key: key);

  @override
  State<BodyDashBoard> createState() => _BodyDashBoardState();
}

class _BodyDashBoardState extends State<BodyDashBoard> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, dashBoardProvider, child) {
        switch (dashBoardProvider.itemSelected.dashboardType) {
          case DashboardType.dashboard:
            return const Center(
              child: Text('Dashboard'),
            );
          case DashboardType.member:
            return ChangeNotifierProvider<MemberProvider>(
              create: (context) => MemberProvider(),
              child: const MemberDashBoard(),
            );
          case DashboardType.employee:
            return ChangeNotifierProvider<EmployeeProvider>(
              create: (context) => EmployeeProvider(),
              child: const EmployeeDashBoard(),
            );
          case DashboardType.store:
            return ChangeNotifierProvider<StoresProvider>(
              create: (context) => StoresProvider(),
              child: const StoresDashboard(),
            );
          case DashboardType.product:
            return ChangeNotifierProvider<ProductsProvider>(
              create: (context) => ProductsProvider(),
              child: const ProductsDashboard(),
            );
          case DashboardType.coupon:
            return const CouponDashboard();
          case DashboardType.promotion:
            return const PromotionDashboard();
          case DashboardType.memberSettings:
            return const Center(
              child: Text('Member Setting'),
            );
          case DashboardType.appSettings:
            return const Center(
              child: Text('App Setting'),
            );
          case DashboardType.orderHistory:
            return const Center(
              child: Text('Lịch sử đơn hàng'),
            );
          default:
            return ChangeNotifierProvider<MemberProvider>(
              create: (context) => MemberProvider(),
              child: const MemberDashBoard(),
            );
        }
      },
    );
  }
}

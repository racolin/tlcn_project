import 'package:flutter/material.dart';
import 'package:tlcn_project/models/user_model.dart';
import 'package:tlcn_project/resources/colors.dart';
import 'package:tlcn_project/widgets/dashboard/title/search_title_widget.dart';
import 'package:tlcn_project/widgets/dashboard/title/user_widget.dart';
import 'package:tlcn_project/models/drawer_model.dart';

class DashboardTitleWidget extends StatelessWidget {
  const DashboardTitleWidget({
    Key? key,
    required this.drawerItem,
    required this.user,
  }) : super(key: key);
  final DrawerItemModel drawerItem;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(colors['light']!),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 24),
          Text(
            drawerItem.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          const SearchTitleWidget(),
          const SizedBox(width: 32),
          UserWidget(user: user),
        ],
      ),
    );
  }
}

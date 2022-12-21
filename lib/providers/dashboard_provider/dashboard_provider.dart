import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/drawer_model.dart';
import 'package:tlcn_project/models/user_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';

import '../../services/cache/cache.dart';

class DashboardProvider extends ChangeNotifier {

  UserModel _user = UserModel(
    username: '',
    avatar:
    'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=',
  );

  UserModel get user => _user;

  Future<void> loadUser(BuildContext context) async {
    _user = await context.watch<Cache>().getUser();
    notifyListeners();
  }

  var _itemSelected = DrawerItemModel('Member', Icons.group, DashboardType.member);

  void select(DrawerItemModel drawerItem) {
    _itemSelected = drawerItem;
    notifyListeners();
  }

  String search = '';

  void onSearch(String searchKey) {
    if (search != searchKey) {
      search = searchKey;
      notifyListeners();
    }
  }

  DrawerItemModel get itemSelected => _itemSelected;
}
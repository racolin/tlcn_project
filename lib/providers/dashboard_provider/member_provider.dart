import 'package:flutter/material.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/utils/member_util.dart';

import '../../models/rank_model.dart';
import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error.dart';
import '../../services/rest_api/api_error_type.dart';

enum MembersScreenType { main, edit }

class MemberProvider extends ChangeNotifier with ApiError {
  MembersScreenType _membersScreenType = MembersScreenType.main;

  MembersScreenType get membersScreenType => _membersScreenType;

  String search = '';
  String role = '';

  bool loading = false;
  List<String> headers = [
    "ID",
    'NAME',
    'MEMBER RANK',
    'TOTAL POINT',
    'USED POINT',
    'CURRENT POINT',
    'JOIN DATE',
    'ACTION'
  ];
  List<int> rates = [1, 4, 2, 2, 2, 2, 2, 2];

  MemberModel _memberSelected = MemberModel(
    id: '1',
    name: 'Phan Trung Tin',
    image:
        'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
    rank: RankModel(
      'assets/images/icon_diamond.png',
      'Diamond',
      0xFFA020F0,
    ),
    totalPoint: 3107,
    usedPoint: 2022,
    currentPoint: 1095,
    joinDate: DateTime.now(),
    hide: false,
  );

  MemberModel get memberSelected => _memberSelected;
  List<MemberUtil> _memberUtils = [];

  List<MemberModel> get members {
    List<MemberModel> result =
        _memberUtils.map((e) => MemberModel.fromUtil(e)).toList();
    return result;
  }

  Future<void> loadMemberUtils(BuildContext context) async {
    await apiCallSafety(
      () => Api().getDio("member/list", {}, context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null) {
            print('******1');
            _memberUtils = (res['data'] as List)
                .map((e) => MemberUtil.fromJson(e))
                .toList();
            print('******2');
            notifyListeners();
          }
        }
      },
      onError: (dynamic error) async {
        final ApiErrorType errorType = await parseApiErrorType(error);
        error = errorType.message;
      },
      skipOnError: true,
    );
  }

  // Future<void> createMember(BuildContext context, MemberModel member) async {
  //   await apiCallSafety(
  //     () => Api().postDio(
  //         "member/create",
  //         {
  //           'username': member.,
  //           'role': member.role,
  //           'store': '',
  //         },
  //         context),
  //     onStart: () async {
  //       loading = true;
  //     },
  //     onCompleted: (bool? status, dynamic res) async {
  //       loading = false;
  //       if (status != null && status && res != null) {
  //         if (res["data"] != null) {
  //           notifyListeners();
  //         }
  //       }
  //     },
  //     onError: (dynamic error) async {
  //       final ApiErrorType errorType = await parseApiErrorType(error);
  //       error = errorType.message;
  //     },
  //     skipOnError: true,
  //   );
  // }

  void selectMember(String id) {
    _memberSelected;
    _membersScreenType = MembersScreenType.edit;
    notifyListeners();
  }

  @override
  Future<int> onApiError(error) {
    // TODO: implement onApiError
    throw UnimplementedError();
  }
}

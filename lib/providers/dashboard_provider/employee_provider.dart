import 'package:flutter/material.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/utils/employee_util.dart';

import '../../services/rest_api/api.dart';
import '../../services/rest_api/api_error.dart';
import '../../services/rest_api/api_error_type.dart';

enum EmployeesScreenType { main, edit }

class EmployeeProvider extends ChangeNotifier with ApiError {
  EmployeesScreenType _employeesScreenType = EmployeesScreenType.main;

  EmployeesScreenType get employeesScreenType => _employeesScreenType;

  String keyword = '';

  Map<String, String> filter = {};

  bool loading = false;
  List<String> headers = [
    "ID",
    'NAME',
    'USERNAME',
    'EMAIL',
    'ROLE',
    'JOIN DATE',
    'ACTION'
  ];
  List<int> rates = [1, 4, 2, 4, 2, 2, 2];
  var rows = [
    for (var i = 0; i < 0; i++)
      EmployeeRow(
        EmployeeModel(
          id: '1',
          name: 'Phan Trung Tin',
          image:
              'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
          username: 'admin1',
          email: 'phantrungtin01@gmail.com',
          role: 'admin',
          joinDate: DateTime.now(),
          hide: false,
        ),
      ),
    EmployeeRow(
      EmployeeModel(
        id: '1',
        name: 'Phan Trung Tín',
        image:
            'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
        username: 'admin01',
        email: 'phantrungtin01@gmail.com',
        role: 'admin',
        joinDate: DateTime.now(),
        hide: false,
      ),
    ),
    EmployeeRow(
      EmployeeModel(
        id: '2',
        name: 'Nguyễn Quang Vinh',
        image:
            'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
        username: 'salesman01',
        email: '19110450@student.hcmute.edu.vn',
        role: 'salesman',
        joinDate: DateTime.now(),
        hide: false,
      ),
    ),
  ];

  EmployeeModel _employeeSelected = EmployeeModel(
    id: '1',
    name: 'Phan Trung Tin',
    image:
        'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
    username: 'admin1',
    email: 'phantrungtin01@gmail.com',
    role: 'admin',
    joinDate: DateTime.now(),
    hide: false,
  );

  EmployeeModel get employeeSelected => _employeeSelected;
  List<EmployeeUtil> _employeeUtils = [];
  List<EmployeeModel> get employees {
    List<EmployeeModel> result =
        _employeeUtils.map((e) => EmployeeModel.fromUtil(e)).toList();
    result.addAll(<EmployeeModel>[
      EmployeeModel(
        id: '1',
        name: 'Phan Trung Tín',
        image:
            'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
        username: 'admin01',
        email: 'phantrungtin01@gmail.com',
        role: 'admin',
        joinDate: DateTime.now(),
        hide: false,
      ),
      EmployeeModel(
        id: '2',
        name: 'Nguyễn Quang Vinh',
        image:
            'https://genk.mediacdn.vn/139269124445442048/2022/5/16/photo-1-1652713299647160238202-1652713647852-16527136480582024311731.jpg',
        username: 'salesman01',
        email: '19110450@student.hcmute.edu.vn',
        role: 'salesman',
        joinDate: DateTime.now(),
        hide: false,
      ),
    ]);
    return result;
  }

  Future<void> loadEmployeeUtils(BuildContext context) async {
    await apiCallSafety(
      () => Api().getDioNotAuthor(
          "employee/create",
          {
            'keyword': keyword,
          },
          context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null) {
            _employeeUtils = (res['data'] as List)
                .map((e) => EmployeeUtil.fromJson(e))
                .toList();
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

  void onSearch(BuildContext context, String keyword) {
    this.keyword = keyword;
    loadEmployeeUtils(context);
  }

  Future<void> createEmployee(
      BuildContext context, EmployeeModel employee) async {
    await apiCallSafety(
      () => Api().postDio(
          "employee/create",
          {
            'username': employee.username,
            'role': employee.role,
            'store': '',
          },
          context),
      onStart: () async {
        loading = true;
      },
      onCompleted: (bool? status, dynamic res) async {
        loading = false;
        if (status != null && status && res != null) {
          if (res["data"] != null) {
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

  void selectEmployee(String id) {
    _employeeSelected;
    _employeesScreenType = EmployeesScreenType.edit;
    notifyListeners();
  }

  @override
  Future<int> onApiError(error) {
    // TODO: implement onApiError
    throw UnimplementedError();
  }
}

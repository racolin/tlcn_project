import 'package:tlcn_project/models/filter_field_model.dart';

class FilterModel {
  final String key;
  final String name;
  final List<FilterFieldModel> values;
  int itemSelected = 0;

  FilterModel({
    required this.key,
    required this.name,
    required this.values,
    required this.itemSelected,
  });

  void onSelect(int value) {
    itemSelected = value;
  }
}

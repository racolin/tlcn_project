import 'package:tlcn_project/utils/member_util.dart';

class RankModel {
  final String image;
  final String name;
  final int color;

  RankModel(
      this.image,
      this.name,
      this.color,
      );

  factory RankModel.fromUtil(RankUtil util) {
    return RankModel(util.display.icon, util.name, 0xFFFFFFFF);
  }
}
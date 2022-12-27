import 'package:flutter/material.dart';
import 'package:tlcn_project/models/rank_model.dart';

class RanksWidget extends StatelessWidget {
  final List<RankModel> ranks;

  const RanksWidget({
    Key? key,
    required this.ranks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 216,
      height: 36,
      child: Stack(
        children: <Widget>[
          for (int i = 0; i < ranks.length; i++)
            Positioned(
              left: i * 18,
              height: 36,
              width: 36,
              child: Image.network(
                ranks[i].image,
                width: 36,
                height: 36,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}

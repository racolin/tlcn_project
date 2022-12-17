import 'package:flutter/material.dart';
import 'package:tlcn_project/resources/colors.dart';
import 'package:tlcn_project/support/convert.dart';
import 'package:tlcn_project/model/total_model.dart';

class TotalWidget extends StatelessWidget {
  final TotalModel util;

  const TotalWidget({
    Key? key,
    required this.util,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(util.color),
      elevation: 2,
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(util.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 1),),
                    const SizedBox(height: 12,),
                    Text(
                      util.amount.toString(),
                      style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(util.image),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                Text(doubleToPercent(util.percent,), style: TextStyle(color: Color(colors['negative-bold']!), fontSize: 16),),
                const SizedBox(width: 8,),
                Text(util.time, style: const TextStyle(fontSize: 16),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

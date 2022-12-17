import 'package:flutter/material.dart';
import 'package:tlcn_project/resources/colors.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/ranks_widget.dart';

class CouponItemWidget extends StatefulWidget {
  final CouponRow row;
  final List<int> rate;

  const CouponItemWidget({
    Key? key,
    required this.row,
    required this.rate,
  }) : super(key: key);

  @override
  State<CouponItemWidget> createState() => _CouponItemWidgetState();
}

class _CouponItemWidgetState extends State<CouponItemWidget> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    var coupon = widget.row.coupon;
    return Container(
      margin: const EdgeInsets.all(1),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            color = value ? Color(colors['light-grey']!) : Colors.white;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          color: color,
          child: Row(
            children: [
              Expanded(
                flex: widget.rate[0],
                child: Text(coupon.id),
              ),
              Expanded(
                flex: widget.rate[1],
                child: Text(coupon.code),
              ),
              Expanded(
                flex: widget.rate[2],
                child: Text(
                  coupon.title,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[3],
                child: RanksWidget(ranks: coupon.applyTo,),
              ),
              Expanded(
                flex: widget.rate[4],
                child: Text(
                  coupon.appliedTime.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[5],
                child: Text(
                  coupon.scope,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[6],
                child: Text(
                  coupon.type,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[7],
                child: Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(4),
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(4),
                      onPressed: () {},
                      icon: coupon.hide ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tlcn_project/resources/colors.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/ranks_widget.dart';

class PromotionItemWidget extends StatefulWidget {
  final PromotionRow row;
  final List<int> rate;

  const PromotionItemWidget({
    Key? key,
    required this.row,
    required this.rate,
  }) : super(key: key);

  @override
  State<PromotionItemWidget> createState() => _PromotionItemWidgetState();
}

class _PromotionItemWidgetState extends State<PromotionItemWidget> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    var promotion = widget.row.promotion;
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
                child: Text(promotion.id),
              ),
              Expanded(
                flex: widget.rate[1],
                child: Text(promotion.partner),
              ),
              Expanded(
                flex: widget.rate[2],
                child: Text(
                  promotion.title,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[3],
                child: RanksWidget(ranks: promotion.applyTo,),
              ),
              Expanded(
                flex: widget.rate[4],
                child: Text(
                  promotion.coupon,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[5],
                child: Text(
                  promotion.cost.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[6],
                child: Text(
                  promotion.status,
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
                      icon: promotion.hide ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
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

import 'package:flutter/material.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/resources/colors.dart';
import 'package:tlcn_project/supports/convert.dart';
import 'package:tlcn_project/widgets/dashboard/list/member_item_widget.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductRow row;
  final List<int> rate;

  const ProductItemWidget({
    Key? key,
    required this.row,
    required this.rate,
  }) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    var product = widget.row.product;
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
                child: Text(product.id),
              ),
              Expanded(
                flex: widget.rate[1],
                child: MemberWidget(name: product.name, image: product.image),
              ),
              Expanded(
                flex: widget.rate[2],
                child: Text(
                  numberToCurrency(product.price, 'VND'),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[3],
                child: getStatusWidget(product.perWeek),
              ),
              Expanded(
                flex: widget.rate[4],
                child: Text(
                  product.category,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[5],
                child: Text(
                  dateToString(product.dateTime, 'hh:MM dd/mm/yyyy'),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[6],
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
                      icon: product.hide
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
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

  Widget getStatusWidget(int value) {
    return Row(
      children: [
        Icon(value < 0 ? Icons.arrow_circle_down : Icons.arrow_circle_up),
        Text('$value units / week'),
      ],
    );
  }
}

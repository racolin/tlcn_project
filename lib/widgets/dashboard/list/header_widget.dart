import 'package:flutter/material.dart';
import 'package:tlcn_project/model/row_model.dart';

class HeaderWidget extends StatelessWidget {
  final RowHeader header;
  final List<int> rate;

  const HeaderWidget({
    Key? key,
    required this.header,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < header.headers.length; i++) {
      list.add(
        Expanded(
          flex: rate[i],
          child: Text(
            header.headers[i],
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: list,
      ),
    );
  }
}


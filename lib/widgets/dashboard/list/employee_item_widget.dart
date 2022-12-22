import 'package:flutter/material.dart';
import 'package:tlcn_project/resources/colors.dart';
import 'package:tlcn_project/models/row_model.dart';
import 'package:tlcn_project/widgets/dashboard/list/member_item_widget.dart';
import 'package:tlcn_project/widgets/dashboard/list/header_widget.dart';

import '../../../supports/convert.dart';

class EmployeeItemWidget extends StatefulWidget {
  final EmployeeRow row;
  final List<int> rate;

  const EmployeeItemWidget({
    Key? key,
    required this.row,
    required this.rate,
  }) : super(key: key);

  @override
  State<EmployeeItemWidget> createState() => _EmployeeItemWidgetState();
}

class _EmployeeItemWidgetState extends State<EmployeeItemWidget> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    var employee = widget.row.employee;
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
                child: Text(employee.id),
              ),
              Expanded(
                flex: widget.rate[1],
                child: MemberWidget(
                  name: employee.name,
                  image: employee.image,
                ),
              ),
              Expanded(
                flex: widget.rate[2],
                child: Text(
                  employee.username,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[3],
                child: Text(
                  employee.email,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[4],
                child: Text(
                  employee.role,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[5],
                child: Text(
                  dateToString(employee.joinDate, 'dd/MM/yyyy'),
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
                      icon: employee.hide ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
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
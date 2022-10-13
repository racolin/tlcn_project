import 'package:flutter/material.dart';
import 'package:tlcn_project/resoures/colors.dart';
import 'package:tlcn_project/widgets/dashboard/row_util.dart';

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
          child: Text(header.headers[i], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
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

class MemberWidget extends StatelessWidget {
  final Member member;

  const MemberWidget({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
              member.image /*, height: 48, width: 48, fit: BoxFit.cover,*/),
        ),
        const SizedBox(width: 16,),
        Text(member.name, style: TextStyle(fontSize: 16),),
      ],
    );
  }
}

class MemberItemWidget extends StatefulWidget {
  final MemberRow row;
  final List<int> rate;

  const MemberItemWidget({
    Key? key,
    required this.row,
    required this.rate,
  }) : super(key: key);

  @override
  State<MemberItemWidget> createState() => _MemberItemWidgetState();
}

class _MemberItemWidgetState extends State<MemberItemWidget> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
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
                child: MemberWidget(
                  member: widget.row.member,
                ),
              ),
              Expanded(
                flex: widget.rate[1],
                child: Text(widget.row.phone, style: TextStyle(fontSize: 16),),
              ),
              Expanded(
                flex: widget.rate[2],
                child: Text(widget.row.memberType.name, style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

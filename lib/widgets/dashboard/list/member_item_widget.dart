import 'package:flutter/material.dart';
import 'package:tlcn_project/resources/colors.dart';
import 'package:tlcn_project/model/row_model.dart';

class MemberWidget extends StatelessWidget {
  final String name;
  final String image;

  const MemberWidget({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(image),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 16),
        ),
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
    var member = widget.row.member;
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
                child: Text(member.id),
              ),
              Expanded(
                flex: widget.rate[1],
                child: MemberWidget(
                  name: member.name,
                  image: member.image,
                ),
              ),
              Expanded(
                flex: widget.rate[2],
                child: ListTile(
                  leading: Image.network(
                    member.rank.image,
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                  title: Text(member.rank.name),
                ),
              ),
              Expanded(
                flex: widget.rate[3],
                child: Text(
                  member.totalPoint.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[4],
                child: Text(
                  member.usedPoint.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[5],
                child: Text(
                  member.currentPoint.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: widget.rate[6],
                child: Text(
                  member.joinDate.toString(),
                  style: const TextStyle(fontSize: 16),
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
                      icon: member.hide ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
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
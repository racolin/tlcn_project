import 'package:flutter/material.dart';

class PageNumWidget extends StatelessWidget {
  final bool isSelected;
  final String value;

  const PageNumWidget({
    Key? key,
    required this.value,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 40,
      width: 40,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(
              isSelected ? Colors.blue : Colors.white),
        ),
        child: Text(
          value,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}

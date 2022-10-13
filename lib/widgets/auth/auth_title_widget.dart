import 'package:flutter/material.dart';

class AuthTitleWidget extends StatelessWidget {
  const AuthTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            'assets/images/icon_logo.png',
            height: 64,
            width: 64,
            fit: BoxFit.cover,
          ),
        ),
        const Text('Welcome to Bubble tea!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
      ],
    );
  }
}

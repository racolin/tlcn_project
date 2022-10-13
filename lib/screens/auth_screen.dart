import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tlcn_project/widgets/auth/auth_widget.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/banner.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topLeft),
              ),
            ),
          ),
          const AspectRatio(aspectRatio: 4 / 5, child: AuthWidget())
        ],
      ),
    );
  }
}

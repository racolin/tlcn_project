import 'package:flutter/material.dart';
import 'package:tlcn_project/models/user_model.dart';

class UserWidget extends StatelessWidget {
  final UserModel user;

  const UserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: user.avatar == null ? Image.asset(
                  'assets/images/icon_logo.png',
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                ) : Image.network(user.avatar!),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          user.username,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

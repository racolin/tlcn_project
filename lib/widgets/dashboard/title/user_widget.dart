import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/user_model.dart';
import 'package:tlcn_project/pages/loading_page.dart';

import '../../../services/cache/cache.dart';

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
          child: user.avatar == null
              ? Image.asset(
                  'assets/images/icon_logo.png',
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  user.avatar!,
                  height: 36,
                  width: 36,
                ),
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
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  contentPadding: const EdgeInsets.all(16),
                  title: const Text('Bạn có thực sự muốn đăng xuất?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Huỷ"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var cache = Provider.of<Cache>(context, listen: false);
                        await cache.saveData('access_token', '');
                        await cache.saveData('refresh_token', '');
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.of(context).pop();
                          Navigator.pushReplacementNamed(context, LoadingPage.routeName);
                        });
                      },
                      child: const Text(
                        "Đăng xuất",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ]),
            );
          },
          icon: const Icon(Icons.logout),
          splashRadius: 24,
        ),
      ],
    );
  }
}

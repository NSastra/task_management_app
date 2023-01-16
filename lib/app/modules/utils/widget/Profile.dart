import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controllers/auth_controller.dart';
import '../style/AppColors.dart';

class Profile extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone
          ? Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 200,
                      foregroundImage:
                          NetworkImage(authC.auth.currentUser!.photoURL!),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authC.auth.currentUser!.displayName!,
                        style: const TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        authC.auth.currentUser!.email!,
                        style: const TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                children: [
                  ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 75,
                      foregroundImage:
                          NetworkImage(authC.auth.currentUser!.photoURL!),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authC.auth.currentUser!.displayName!,
                        style: const TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        authC.auth.currentUser!.email!,
                        style: const TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

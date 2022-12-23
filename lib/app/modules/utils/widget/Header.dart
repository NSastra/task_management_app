import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../style/AppColors.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Task Management",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.PrimaryText,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Manage Your Tasks With Ease Through Friends",
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.PrimaryText,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(left: 40, right: 10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  // ignore: prefer_const_constructors
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.PrimaryText,
                  ),
                  hintText: "Search",
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: const CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 25,
                foregroundImage: NetworkImage(
                    'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.notifications,
              color: AppColors.PrimaryText,
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Get.defaultDialog(
                  title: "Sign Out",
                  content: const Text("Are you sure want to sign out?"),
                  cancel: ElevatedButton(
                    onPressed: () => Get.back,
                    child: const Text("Cancel"),
                  ),
                  confirm: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: const Text("Sign Out"),
                  ),
                );
              },
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: const [
                  Text(
                    "Sign Out",
                    style: TextStyle(color: AppColors.PrimaryText),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.logout,
                    color: AppColors.PrimaryText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

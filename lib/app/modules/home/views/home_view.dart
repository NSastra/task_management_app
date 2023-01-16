// import 'dart:html';

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:task_management_app/app/modules/utils/style/AppColors.dart';
import 'package:task_management_app/app/modules/utils/widget/FriendsSuggestions.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';

import '../../../data/controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../utils/widget/Header.dart';
import '../../utils/widget/MyFriends.dart';
import '../../utils/widget/MyTask.dart';
import '../../utils/widget/SideBar.dart';
import '../../utils/widget/UpcomingTask.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  // const HomeView({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 150, child: SideBar()),
      backgroundColor:
          AppColors.PrimaryBg, //pewarnaan menggunakan class dari AppColors.dart
      // backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone //untuk mengecek resolui, jika <600px maka expanded / sidebar akan hilang
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                    //import widget siderbar.dart, cara lain = hapus dan ganti dengan isi SideBar.dart
                  )
                : const SizedBox(), //untuk sisi kiri
            Expanded(
              flex: 10,
              child: Column(children: [
                !context.isPhone
                    ? const Header()
                    : Container(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _drawerKey.currentState!.openDrawer();
                                //untuk membuka menu
                              },
                              // ignore: prefer_const_constructors
                              icon: Icon(
                                Icons.menu,
                                color: AppColors.PrimaryText,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
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
                                  "Manage Your Tasks With Ease",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.PrimaryText,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.notifications,
                              color: AppColors.PrimaryText,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.defaultDialog(
                                  title: "Sign Out",
                                  content: const Text(
                                      "Are you sure want to sign out?"),
                                  cancel: ElevatedButton(
                                    onPressed: () => Get.back,
                                    child: const Text("Cancel"),
                                  ),
                                  confirm: ElevatedButton(
                                    // onPressed: () => Get.toNamed(Routes.LOGIN),
                                    onPressed: () => authC.logout(),
                                    child: const Text("Sign Out"),
                                  ),
                                );
                              },
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: const [
                                  Text(
                                    "Sign Out",
                                    style:
                                        TextStyle(color: AppColors.PrimaryText),
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
                            const SizedBox(
                              width: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: const CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                radius: 25,
                                foregroundImage: NetworkImage(
                                    'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                              ),
                            )
                          ],
                        ),
                      ),
                Expanded(
                  child: Container(
                    padding: !context.isPhone
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.all(10),
                    margin: !context.isPhone
                        //menghilangkan margin jika resolusi <600px
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: !context.isPhone
                          //mengecilkan lengkungan jika resoulusi <600px
                          ? BorderRadius.circular(30)
                          : BorderRadius.circular(30),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text('Welcome To The Task Management App',
                        //     style: TextStyle(
                        //       fontSize: 27,
                        //       color: AppColors.PrimaryText,
                        //     )),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: Get.height * 0.4,
                          //widget MyTask dan cardnya
                          // child: FriendsSuggestions(),
                          child: Image.asset(
                            context.isPhone
                                ? 'assets/images/wide-todolist.jpg'
                                : 'assets/images/list.jpg',
                            width: Get.width,
                            height: Get.height * 0.3,
                          ),
                        ),
                        //context untuk menghilangkan grid foto ketika resolusi <600px
                        !context.isPhone
                            ? Expanded(
                                child: Row(
                                  children: [
                                    // widget yang berisi upcoming task dan cardnya
                                    const UpcomingTask(),
                                    MyFriends(),
                                  ],
                                ),
                              )
                            : const UpcomingTask(),
                      ],
                    ),
                  ),
                )
              ]),
            ), //untuk sisi kanan
          ],
        ),
      ),
    );
  }
}

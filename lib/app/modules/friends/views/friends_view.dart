import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/widget/Header.dart';
import '../../utils/widget/MyFriends.dart';
import '../../utils/widget/SideBar.dart';
import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor:
          AppColors.PrimaryBg, //pewarnaan menggunakan class dari AppColors.dart
      // backgroundColor: Colors.blue[100],
      body: Row(
        children: [
          !context.isPhone //untuk mengecek resolui, jika <600px maka expanded / sidebar akan hilang
              ? const Expanded(
                  flex: 2,
                  child: SideBar(),
                  //import widget siderbar.dart, cara lain = hapus dan ganti dengan isi SideBar.dart
                )
              : const SizedBox(), //untuk sisi kiri
          Expanded(
            flex: 17,
            child: Column(children: [
              !context.isPhone
                  ? const Header()
                  : Container(
                      padding: const EdgeInsets.all(20),
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
                      ? const EdgeInsets.all(30)
                      : const EdgeInsets.all(20),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'People You May Know',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w200,
                          color: AppColors.PrimaryText,
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          //untuk fungsi scroll pada card, bisa horizontal ataupun vertical
                          shrinkWrap: true,
                          itemCount: 6,
                          clipBehavior: Clip.antiAlias,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: const Image(
                                      image: NetworkImage(
                                          'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                                    ),
                                  ),
                                  const Positioned(
                                    bottom: 10,
                                    left: 70,
                                    child: Text(
                                      'Shania Gracia',
                                      style: TextStyle(
                                        color: AppColors.PrimaryText,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 1,
                                    right: 0,
                                    child: SizedBox(
                                      height: 36,
                                      width: 36,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: const Icon(
                                            Icons.add_reaction_sharp),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const MyFriends(),
                    ],
                  ),
                ),
              )
            ]),
          ), //untuk sisi kanan
        ],
      ),
    );
  }
}

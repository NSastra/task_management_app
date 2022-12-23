import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../style/AppColors.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        height: Get.height,
        // color: Colors.blue[100],
        color: AppColors.PrimaryBg,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              child: const Image(
                image: AssetImage('assets/icons/icon.png'),
              ),
            ),
            const SizedBox(
              height: 50,
            ), //SizedBox adalah perintah untuk menampilkan white space
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute ==
                                "/home" //mengecek apakah menu yg aktif sama dengan route nya
                            ? BoxDecoration(
                                //tanda tanya ini sebagai 'if'
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white)
                            : const BoxDecoration(), //titik dua di sini sebagai else, wajib ada jika menggunakan '?'
                        child: Icon(
                          //jika Icon ditambah const akan membuat Get menjadi error
                          Get.currentRoute == "/home"
                              ? Icons.desktop_mac
                              : Icons.desktop_mac_outlined,
                          color: AppColors.PrimaryText,
                          // color: Colors.grey;
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Home',
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          // color: Colors.grey;
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.HOME),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute == '/task'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white)
                            : const BoxDecoration(),
                        child: Icon(
                          Get.currentRoute == '/task'
                              ? Icons.task
                              : Icons.task_outlined,
                          color: AppColors.PrimaryText,
                          // color: Colors.grey;
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Task',
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.TASK),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute == '/friends'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white)
                            : const BoxDecoration(),
                        child: Icon(
                          Get.currentRoute == '/friends'
                              ? Icons.group
                              : Icons.group_outlined,
                          color: AppColors.PrimaryText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Friends',
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          // color: Colors.grey;
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.FRIENDS),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Center(
                child: InkWell(
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: Get.currentRoute == '/profile'
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.white)
                            : const BoxDecoration(),
                        child: Icon(
                          Get.currentRoute == '/profile'
                              ? Icons.account_box
                              : Icons.account_box_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Get.toNamed(Routes.PROFILE),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

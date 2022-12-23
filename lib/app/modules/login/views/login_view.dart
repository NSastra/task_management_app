import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_management_app/app/modules/utils/style/AppColors.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[100],
      backgroundColor: AppColors.PrimaryBg,
      body: Container(
          margin: context.isPhone //pengaturan margin sesuai resolusi layar
              ? EdgeInsets.all(Get.width * 0.1)
              : EdgeInsets.all(Get.height * 0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: Row(
            children: [
              //sisi kiri / biru
              !context.isPhone
                  ? Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              // topRight: Radius.circular(50),
                              bottomLeft: Radius.circular(50)),
                          color: Colors.blue,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(35.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Selamat Datang",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40),
                                ),
                                Text(
                                  "Silakan Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                Text(
                                  "Eksplorasi Bersama Kami",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ]),
                        ),
                      ),
                    )
                  : const SizedBox(), //pemisah atau else dari !context.isPhone
              //sizedBox() berfungsi untuk menampilkan halaman atau bagian kosong
              //sisi kanan / putih
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.isPhone
                          ? //pengecekan screen, menampilkan kalimat selamat datang untuk tampilan phone
                          Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                  Text(
                                    "Selamat Datang",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 40),
                                  ),
                                  Text(
                                    "Silakan Login",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                  Text(
                                    "Eksplorasi Bersama Kami",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ])
                          : const SizedBox(),
                      Image.asset(
                        'assets/images/login.png',
                        height: Get.height * 0.5,
                      ),
                      FloatingActionButton.extended(
                        onPressed: () => Get.toNamed(Routes.HOME),
                        label: const Text('Sign In With Google'),
                        icon: const Icon(
                          Icons.emoji_emotions,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

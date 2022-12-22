// import 'dart:html';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';
// import 'package:task_management_app/app/routes/app_pages.dart';

import '../../utils/widget/Header.dart';
import '../../utils/widget/SideBar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Row(
          children: [
            const Expanded(
              flex: 2,
              child:
                  SideBar(), //import widget siderbar.dart, cara lain = hapus dan ganti dengan isi SideBar.dart
            ), //untuk sisi kiri
            Expanded(
              flex: 17,
              child: Column(children: [
                const Header(),
                Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(50),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        )))
              ]),
            ), //untuk sisi kanan
          ],
        ));
  }
}

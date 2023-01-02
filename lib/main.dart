import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_management_app/firebase_options.dart';

import 'app/data/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    name: "task management project",
  );
  Get.put(AuthController(), permanent: true);
  //permanent true ditulis agar controller dapat dipakai disemua page
  runApp(StreamBuilder<User?>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
        //Jika proses login masih berlangsung, maka akan tampil buffer loading di layar
      }
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        // initialRoute: AppPages.INITIAL,
        initialRoute: snapshot.data != null ? Routes.HOME : Routes.LOGIN,
        getPages: AppPages.routes,
      );
    },
  ));
}

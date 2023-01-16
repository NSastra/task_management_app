import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/controllers/auth_controller.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();
  late TextEditingController titleController,
      descriptionController,
      dueDateController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    dueDateController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void saveUpdateTask(
      {String? title,
      String? description,
      String? dueDate,
      String? docId,
      String? type}) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    CollectionReference taskCollection = firestore.collection('task');
    CollectionReference usersCollection = firestore.collection('users');
    var taskId = DateTime.now().toIso8601String();
    if (type == 'Add') {
      await taskCollection.doc(taskId).set({
        'title': title,
        'description': description,
        'due_date': dueDate,
        'status': '0',
        'total_task': '0',
        'total_task_finished': '0',
        'task_detail': [],
        'asign_to': [authC.auth.currentUser!.email],
        'created_by': authC.auth.currentUser!.email,
      }).whenComplete(() async {
        await usersCollection.doc(authC.auth.currentUser!.email).set({
          'taskId': FieldValue.arrayUnion([taskId])
        }, SetOptions(merge: true));
        await taskCollection.doc(authC.auth.currentUser!.email).set({
          'taskId': FieldValue.arrayUnion([taskId])
        }, SetOptions(merge: true));
        //task_id digunakan untuk membuat list seperti list_cari di dalam collection firestore
        Get.back();
        Get.snackbar('Task', 'Success to $type task');
      }).catchError((error) {
        Get.snackbar('Task', 'Failed to $type task');
      });
    } else {
      //else untuk kondisi type selain add
      await taskCollection.doc(docId).update({
        'title': title,
        'description': description,
        'due_date': dueDate,
      }).whenComplete(() async {
        // await usersCollection.doc(authC.auth.currentUser!.email).set({
        //   'taskId': FieldValue.arrayUnion([taskId])
        // }, SetOptions(merge: true));
        await taskCollection.doc(authC.auth.currentUser!.email).set({
          'taskId': FieldValue.arrayUnion([taskId])
        }, SetOptions(merge: true));
        //task_id digunakan untuk membuat list seperti list_cari di dalam collection firestore
        Get.back();
        Get.snackbar('Task', 'Success to $type task');
      }).catchError((error) {
        Get.snackbar('Task', 'Failed to $type task');
      });
    }
  }

  void deleteTask(String taskId) async {}
}

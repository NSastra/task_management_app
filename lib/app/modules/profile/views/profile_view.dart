import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task_management_app/app/modules/utils/widget/FriendsSuggestions.dart';

import '../../../data/controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../utils/style/AppColors.dart';
import '../../utils/widget/Header.dart';
import '../../utils/widget/MyTask.dart';
import '../../utils/widget/Profile.dart';
import '../../utils/widget/SideBar.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
                                    // onPressed: () => Get.toNamed(Routes.LOGIN),
                                    onPressed: () => authC.logout(),
                                    //setelah klik sign out, akan diarahkan ke clss logout di dalam auth controller
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
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(30),
                            //   child: const CircleAvatar(
                            //     backgroundColor: Colors.blueAccent,
                            //     radius: 25,
                            //     foregroundImage: NetworkImage(
                            //         'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                            //   ),
                            // )
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
                    //isi konten utama halaman profile
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Profile(),
                        // SizedBox(
                        //   height: Get.height * 0.4,
                        //   child: MyTask(),
                        // ),
                        Expanded(
                          //stream user untuk mengambil data task list (berdasarkan taskId) dari firestore
                          child: StreamBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                            stream: authC
                                .streamUsers(authC.auth.currentUser!.email!),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              //mengambil taskId
                              var taskId = (snapshot.data!.data()
                                  as Map<String, dynamic>)['taskId'] as List;
                              return ListView.builder(
                                itemCount: taskId.length,
                                clipBehavior: Clip.antiAlias,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return StreamBuilder<
                                      DocumentSnapshot<Map<String, dynamic>>>(
                                    //stream ambil dari var taskId
                                    stream: authC.streamTasks(taskId[index]),
                                    builder: (context, snapshot2) {
                                      if (snapshot2.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      //untuk mengambil data task
                                      //dataTask berisi data di dalam collection task (bagian field)
                                      var dataTask = snapshot2.data!.data();
                                      //untuk mengambil userphoto sesuai asign_to
                                      var dataUserList = (snapshot2.data!.data()
                                              as Map<String, dynamic>)[
                                          'asign_to'] as List;
                                      return GestureDetector(
                                        onLongPress: () {
                                          Get.defaultDialog(
                                              title: dataTask!['title'],
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  TextButton.icon(
                                                    onPressed: () {
                                                      Get.back();
                                                      controller.titleController
                                                              .text =
                                                          dataTask['title'];
                                                      controller
                                                              .descriptionController
                                                              .text =
                                                          dataTask[
                                                              'description'];
                                                      controller
                                                              .dueDateController
                                                              .text =
                                                          dataTask['dueDate'];
                                                      createUpdateTask(
                                                        context: context,
                                                        type: 'Update',
                                                        docId: taskId[index],
                                                      );
                                                    },
                                                    icon:
                                                        const Icon(Icons.edit),
                                                    label: const Text('Update'),
                                                  ),
                                                  TextButton.icon(
                                                    onPressed: () {
                                                      controller.deleteTask(
                                                          taskId[index]);
                                                    },
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    label: const Text('Delete'),
                                                  ),
                                                ],
                                              ));
                                        },
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[350],
                                          ),
                                          margin: const EdgeInsets.all(10.0),
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      height: 20,
                                                      child: ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemCount:
                                                            dataUserList.length,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        physics:
                                                            const ScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index2) {
                                                          return StreamBuilder<
                                                                  DocumentSnapshot<
                                                                      Map<String,
                                                                          dynamic>>>(
                                                              stream: authC
                                                                  .streamUsers(
                                                                      dataUserList[
                                                                          index2]),
                                                              builder: (context,
                                                                  snapshot3) {
                                                                if (snapshot3
                                                                        .connectionState ==
                                                                    ConnectionState
                                                                        .waiting) {
                                                                  return const Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  );
                                                                }
                                                                //ambil data photo dari user
                                                                var dataUserPhoto =
                                                                    snapshot3
                                                                        .data!
                                                                        .data();
                                                                return ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                  child:
                                                                      CircleAvatar(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .blueAccent,
                                                                    radius: 10,
                                                                    foregroundImage:
                                                                        // NetworkImage('https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                                                                        NetworkImage(
                                                                            dataUserPhoto!['photo']),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  Container(
                                                    height: 25,
                                                    width: 80,
                                                    color: AppColors.PrimaryBg,
                                                    child: Center(
                                                      child: Text(
                                                        '${dataTask!['status']} % ',
                                                        style: const TextStyle(
                                                          color: AppColors
                                                              .PrimaryText,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Spacer(),
                                              Container(
                                                height: 25,
                                                width: 200,
                                                color: AppColors.PrimaryBg,
                                                child: Center(
                                                  child: Text(
                                                      '${dataTask['total_task_finished']} / ${dataTask['total_task']} Task Completed'),
                                                ),
                                              ),
                                              Text(
                                                dataTask['title'],
                                                style: const TextStyle(
                                                  color: AppColors.PrimaryText,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                '${dataTask['description']} Due to : ${dataTask['due_date']}',
                                                style: TextStyle(
                                                  color: AppColors.PrimaryText,
                                                  fontSize: !context.isPhone
                                                      ? 15
                                                      : 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ), //untuk sisi kanan
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            createUpdateTask(context: context, type: 'Add', docId: '');
          },
          label: const Text('Add Task'),
          icon: const Icon(Icons.add_circle_outline),
        ),
      ),
    );
  }

  createUpdateTask({BuildContext? context, String? type, String? docId}) {
    Get.bottomSheet(
      //tinggi dari bottomsheet hanya bisa sampai 50% dari total tinggi
      SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
          ),
          margin: context!.isPhone
              ? EdgeInsets.zero
              : const EdgeInsets.only(left: 120, right: 120),
          // height: Get.height,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(children: [
              Text(
                '$type Task',
                style: const TextStyle(
                  color: AppColors.PrimaryText,
                  fontSize: 20,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.title),
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: controller.titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  icon: const Icon(Icons.description),
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: controller.descriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DateTimePicker(
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'Due Date',
                // dateHintText: 'Due Date',
                decoration: InputDecoration(
                  icon: const Icon(Icons.calendar_today),
                  hintText: 'Due Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.date_range),
                controller: controller.dueDateController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Due date cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints:
                    BoxConstraints.tightFor(width: Get.width, height: 40),
                child: ElevatedButton(
                  onPressed: () {
                    controller.saveUpdateTask(
                      title: controller.titleController.text,
                      description: controller.descriptionController.text,
                      dueDate: controller.dueDateController.text,
                      docId: docId!,
                      type: type!,
                    );
                  },
                  child: Text('$type Task'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

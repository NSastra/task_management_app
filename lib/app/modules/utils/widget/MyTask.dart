import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controllers/auth_controller.dart';
import '../style/AppColors.dart';

import '../../utils/style/AppColors.dart';

class MyTask extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final authC = Get.find<AuthController>();
  late TextEditingController titleController,
      descriptionController,
      dueDateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'My Task',
          style: TextStyle(color: AppColors.PrimaryText, fontSize: 30),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: authC.streamUsers(authC.auth.currentUser!.email!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                // ambil taskId dari collection
                var taskId = (snapshot.data!.data()
                    as Map<String, dynamic>)['taskId'] as List;
                //pertama streamUsers digunakan untuk mengambil user yg login, kemudian dari user tersebut akan diambil taskId

                return ListView.builder(
                  itemCount: taskId.length,
                  clipBehavior: Clip.antiAlias,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                        stream: authC.streamTasks(taskId[index]),
                        builder: (context, snapshot2) {
                          if (snapshot2.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          //untuk mengambil data task
                          //dataTask berisi data di dalam collection task (bagian field)
                          var dataTask = snapshot2.data!.data();
                          //untuk mengisi user photo sesuai data login
                          var dataUserList = (snapshot2.data!.data()
                              as Map<String, dynamic>)['asign_to'] as List;
                          return GestureDetector(
                            onLongPress: () {
                              Get.defaultDialog(
                                title: dataTask!['title'],
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton.icon(
                                        onPressed: () {
                                          Get.back();
                                          // controller.titleController.text =
                                          //     dataTask['title'];
                                          // controller.descriptionController
                                          //     .text = dataTask['description'];
                                          // controller.dueDateController.text =
                                          //     dataTask['due_date'];
                                          // createUpdateTask(
                                          //   context: context,
                                          //   type: 'Update',
                                          //   docId: taskId[index],
                                          //   //pakai taskId dari collection users di firestore
                                          // );
                                        },
                                        icon: const Icon(Icons.edit),
                                        label: const Text('Update'))
                                  ],
                                ),
                              );
                            },
                            child: Container(
                              width: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[350]),
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.blueAccent,
                                          radius: 20,
                                          foregroundImage: NetworkImage(
                                              'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        color: AppColors.PrimaryBg,
                                        child: const Center(
                                          child: Text(
                                            '100%',
                                            style: TextStyle(
                                                color: AppColors.PrimaryText),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 15,
                                    width: 200,
                                    color: AppColors.PrimaryBg,
                                    child: const Center(
                                      child: Text(
                                        '10/10 Task Completed',
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Pemrograman Flutter',
                                    style: TextStyle(
                                        color: AppColors.PrimaryText,
                                        fontSize: 20),
                                  ),
                                  const Text(
                                    'Deadline In 3 Days',
                                    style: TextStyle(
                                      color: AppColors.PrimaryText,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                );
              }),
        ),
      ],
    );
  }
}

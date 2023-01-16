import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

import '../../../data/controllers/auth_controller.dart';
import '../style/AppColors.dart';

class MyFriends extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'My Friends',
                  style: TextStyle(
                    // color: AppColors.PrimaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.toNamed(Routes.FRIENDS),
                  child: const Text(
                    'More',
                    style: TextStyle(
                      // color: AppColors.PrimaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const Icon(
                  Icons.navigate_next,
                  color: AppColors.PrimaryText,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 400,
              child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: authC.streamFriends(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var myFriends = (snapshot.data!.data()
                      as Map<String, dynamic>)['emailFriends'] as List;

                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: myFriends.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: !context.isPhone ? 3 : 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: StreamBuilder<
                                DocumentSnapshot<Map<String, dynamic>>>(
                            //ambil isi email dari var myFriends di atas
                            stream: authC.streamUsers(myFriends[index]),
                            builder: (context, snapshot2) {
                              if (snapshot2.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              var data = snapshot2.data!.data();

                              return Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image(
                                      image: NetworkImage(data!['photo']),
                                      height: context.isPhone ? 100 : 100,
                                      width: context.isPhone ? 100 : 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(150),
                                  //   child: const CircleAvatar(
                                  //     backgroundColor: Colors.blueAccent,
                                  //     radius: 50,
                                  //     foregroundImage: NetworkImage(
                                  //         'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                                  //   ),
                                  // ),
                                  Text(data['name'],
                                      style: const TextStyle(
                                          color: AppColors.PrimaryText))
                                ],
                              );
                            }),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

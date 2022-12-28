import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/routes/app_pages.dart';

import '../style/AppColors.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({
    Key? key,
  }) : super(key: key);

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
                    color: AppColors.PrimaryText,
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
                      color: AppColors.PrimaryText,
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
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: !context.isPhone ? 3 : 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: const Image(
                              image: NetworkImage(
                                  'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
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
                          const Text('Shania Gracia',
                              style: TextStyle(color: AppColors.PrimaryText))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

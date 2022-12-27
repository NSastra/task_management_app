import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/AppColors.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: !context.isPhone
          ? Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 150,
                      foregroundImage: NetworkImage(
                          'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Shania Gracia',
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        'shaniagracia@gmail.com',
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                children: [
                  const ClipRRect(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 75,
                      foregroundImage: NetworkImage(
                          'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Shania Gracia',
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        'shaniagracia@gmail.com',
                        style: TextStyle(
                          color: AppColors.PrimaryText,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

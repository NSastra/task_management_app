import 'package:flutter/material.dart';

import '../style/AppColors.dart';

class MyTask extends StatelessWidget {
  const MyTask({
    Key? key,
  }) : super(key: key);

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
          child: ListView(
            clipBehavior: Clip.antiAlias,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Container(
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
                              style: TextStyle(color: AppColors.PrimaryText),
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
                      style:
                          TextStyle(color: AppColors.PrimaryText, fontSize: 20),
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
              Container(
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
                              style: TextStyle(color: AppColors.PrimaryText),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 15,
                      width: 150,
                      color: AppColors.PrimaryBg,
                      child: const Center(
                        child: Text(
                          '10/10 Task Completed',
                        ),
                      ),
                    ),
                    const Text(
                      'Pemrograman Flutter',
                      style:
                          TextStyle(color: AppColors.PrimaryText, fontSize: 20),
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
              Container(
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
                              style: TextStyle(color: AppColors.PrimaryText),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 15,
                      width: 150,
                      color: AppColors.PrimaryBg,
                      child: const Center(
                        child: Text(
                          '10/10 Task Completed',
                        ),
                      ),
                    ),
                    const Text(
                      'Pemrograman Flutter',
                      style:
                          TextStyle(color: AppColors.PrimaryText, fontSize: 20),
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
              Container(
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
                              style: TextStyle(color: AppColors.PrimaryText),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 15,
                      width: 150,
                      color: AppColors.PrimaryBg,
                      child: const Center(
                        child: Text(
                          '10/10 Task Completed',
                        ),
                      ),
                    ),
                    const Text(
                      'Pemrograman Flutter',
                      style:
                          TextStyle(color: AppColors.PrimaryText, fontSize: 20),
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
            ],
          ),
        ),
      ],
    );
  }
}

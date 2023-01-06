import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controllers/auth_controller.dart';
import '../style/AppColors.dart';

class FriendsSuggestions extends StatelessWidget {
  // const FriendsSuggestions({
  //   Key? key,
  // }) : super(key: key);
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: authC.getPeople(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var data = snapshot.data!.docs;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              //untuk fungsi scroll pada card, bisa horizontal ataupun vertical
              shrinkWrap: true,
              // itemCount: 6,
              itemCount: data.length,
              //itemcount disesuaikan dengan panjang data
              clipBehavior: Clip.antiAlias,
              itemBuilder: (context, index) {
                var hasil = data[index].data();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(
                          image: NetworkImage(
                              // 'https://akcdn.detik.net.id/community/media/visual/2020/04/13/c85543ab-4961-4aea-8007-d4bee92a7ee0_43.jpeg?w=250&q='),
                              hasil['photo']),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 70,
                        child: Text(
                          // 'Shania Gracia',
                          hasil['name'],
                          style: const TextStyle(
                            color: AppColors.PrimaryText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 0,
                        child: SizedBox(
                          height: 36,
                          width: 36,
                          child: ElevatedButton(
                            // onPressed: () {},
                            onPressed: () => authC.addFriends(hasil['email']),
                            //mengaktifkan tombol add friends di dalam section people you may know
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(0.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Icon(Icons.add_reaction_sharp),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}

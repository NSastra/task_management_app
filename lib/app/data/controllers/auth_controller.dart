import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential? _userCredential;
  // Future<UserCredential> signInWithGoogle() async {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController searchFriendsController;

  @override
  void onInit() {
    super.onInit();
    searchFriendsController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchFriendsController.dispose();
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    print(googleUser!.email);

    // Once signed in, return the UserCredential
    await auth
        //auth sudah dideklarasikan sebagai FirebaseAuth.instance
        .signInWithCredential(credential)
        // .then((value) => Get.offAllNamed(Routes.HOME));
        .then((value) => _userCredential = value);

    // firebase - menyimpan data user ke dalam firebase firestore (seperti create data)
    CollectionReference users = firestore.collection('users');

    final checkUsers = await users.doc(googleUser.email).get();
    if (!checkUsers.exists) {
      users.doc(googleUser.email).set({
        'uid': _userCredential!.user!.uid,
        'name': googleUser.displayName,
        'email': googleUser.email,
        'photo': googleUser.photoUrl,
        'createdAt': _userCredential!.user!.metadata.creationTime.toString(),
        'lastLoginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      }).then((value) {
        String temp = '';
        try {
          for (var i = 0; i < googleUser.displayName!.length; i++) {
            temp = temp + googleUser.displayName![i];
            users.doc(googleUser.email).set({
              'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
            }, SetOptions(merge: true));
          }
        } catch (e) {
          print(e);
        }
      });
    } else {
      users.doc(googleUser.email).update({
        //jika di firestore data tidak urut, ganti set dengan update
        'name': googleUser.displayName,
        'lastLoginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      }).then((value) {
        String temp = '';
        try {
          for (var i = 0; i < googleUser.displayName!.length; i++) {
            temp = temp + googleUser.displayName![i];
            users.doc(googleUser.email).set({
              'list_cari': FieldValue.arrayUnion([temp.toUpperCase()])
            }, SetOptions(merge: true));
          }
        } catch (e) {
          print(e);
        }
      });
      //pengambilan then.value pada else dilakukan agar list_cari selalu masuk ke firestore walaupun data user sudah ada sebelumnya
    }
    Get.offAllNamed(Routes.HOME);
  }

  //membuat fungsi sign out
  Future logout() async {
    await FirebaseAuth.instance.signOut();
    // GooleSignIn.signOut di bawah ini untuk menyimpan akun yg pernah digunakan untuk login
    await GoogleSignIn().signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  var kataCari = [].obs;
  var hasilCari = [].obs;
  void searchFriends(String keyword) async {
    CollectionReference users = firestore.collection('users');
    if (keyword.isNotEmpty) {
      final hasilQuery = await users
          .where('list_cari', arrayContains: keyword.toUpperCase())
          .get();

      if (hasilQuery.docs.isNotEmpty) {
        for (var i = 0; i < hasilQuery.docs.length; i++) {
          kataCari.add(hasilQuery.docs[i].data() as Map<String, dynamic>);
        }
      }

      if (kataCari.isNotEmpty) {
        hasilCari.value = [];
        kataCari.forEach((element) {
          print(element);
          hasilCari.add(element);
        });
        kataCari.clear();
      }
    } else {
      kataCari.value = [];
      hasilCari.value = [];
    }

    kataCari.refresh();
    hasilCari.refresh();
  }

  void addFriends(String _emailFriends) async {
    //friends di bawah akan menjadi nama collection di dalam firestore database
    CollectionReference friends = firestore.collection('friends');

    final checkFriends = await friends.doc(auth.currentUser!.email).get();
    //checkFriends untuk cek ada data atau tidak

    if (checkFriends.data() == null) {
      await friends.doc(auth.currentUser!.email).set({
        'emailMe': auth.currentUser!.email,
        'emailFriends': [_emailFriends],
      }).whenComplete(
          () => Get.snackbar("Friends", "Friends added with no problem"));
    } else {
      await friends.doc(auth.currentUser!.email).set({
        'emailFriends': FieldValue.arrayUnion([_emailFriends]),
      }, SetOptions(merge: true)).whenComplete(
          () => Get.snackbar("Friends", "Friends added with no problem"));
    }

    hasilCari.clear();
    searchFriendsController.clear();
    Get.back();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamFriends() {
    return firestore
        .collection('friends')
        .doc(auth.currentUser!.email)
        .snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUsers(String email) {
    return firestore.collection('users').doc(email).snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getPeople() async {
    CollectionReference friendsCollect = firestore.collection('friends');
    final checkFriends =
        await friendsCollect.doc(auth.currentUser!.email).get();
    //checkFriends digunakan untuk mengecek di dalam collection friends ada emailFriends siapa saja
    var listFriends =
        (checkFriends.data() as Map<String, dynamic>)['emailFriends'] as List;
    //dari hasil checkFriends akan diambil isi dari atribut emailFriends dan diubah menjadi List
    var hasil = await firestore
        //var dapat diganti dengan QuerySnapshot<Map<String, dynamic>>
        .collection('users')
        .where('email', whereNotIn: listFriends)
        .get();
    return hasil;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamTasks(String taskId) {
    return firestore.collection('task').doc(taskId).snapshots();
  }
}

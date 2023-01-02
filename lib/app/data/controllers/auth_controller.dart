import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserCredential? _userCredential;
  // Future<UserCredential> signInWithGoogle() async {
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
    await FirebaseAuth.instance
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
      });
    } else {
      users.doc(googleUser.email).set({
        'name': googleUser.displayName,
        'lastLoginAt':
            _userCredential!.user!.metadata.lastSignInTime.toString(),
      });
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
}

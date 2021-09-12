import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      print(googleUser?.email);
      print(googleUser?.displayName);

      // if (googleUser != null) {
      //   final GoogleSignInAuthentication googleAuth =
      //       await googleUser.authentication;

      //   final AuthCredential credential = GoogleAuthProvider.credential(
      //     accessToken: googleAuth.accessToken,
      //     idToken: googleAuth.idToken,
      //   );

      //   print(credential.toString());
      // }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Cached Images';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: TextButton(
          onPressed: () {
            signInWithGoogle();
          },
          child: Text('Google Sign in'),
        )),
      ),
    );
  }

  widget({required CircularProgressIndicator child}) {}
}

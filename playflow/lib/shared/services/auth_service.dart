import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playflow/modules/login/login_page.dart';
import '../../modules/home/home_page.dart';

class AuthService{

  var _isAutenticated = false;

  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot){
          if (snapshot.hasData) {
            return HomePage();
          }else{
            return const LoginPage();
          }
      }
    );
  }

   signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
}

  signOut(){
    FirebaseAuth.instance.signOut();
  }

}
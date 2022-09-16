import 'package:flutter/material.dart';
import 'package:playflow/shared/models/user_model.dart';

import '../../shared/services/auth_service.dart';
import 'package:playflow/modules/home/home_page.dart';

class LoginController {
  final authController = AuthService();
  Future<void> signIn(BuildContext context) async {
    try {
      final response = await AuthService().signInWithGoogle();
      final user = UserModel(
          name: response.user.displayName, photoURL: response.user.photoURL);

      authController.setUser(context, user);
    } on Exception catch (e) {
      authController.setUser(context, null);
      print(e);
    }
// AuthService().handleAuthState();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}

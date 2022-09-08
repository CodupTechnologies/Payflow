import 'package:flutter/material.dart';
import 'package:playflow/modules/home/home_page.dart';
import 'package:playflow/modules/splash/splash_page.dart';
import 'package:playflow/shared/services/auth_service.dart';

import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Playflow',
      theme: ThemeData(primaryColor: AppColors.primary),
      home: AuthService().handleAuthState(),
      initialRoute: "/login",
      routes: {
        "/home": (context) => HomePage(),
        "/login":(context) => LoginPage(),
        "/splash":(context) => SplashPage()

      },
    );
  }
}

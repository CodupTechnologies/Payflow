import 'package:flutter/material.dart';
import 'package:playflow/modules/login/login_page.dart';

import '../../shared/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Principal"),
      ),
      body: Container(
        child: Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                AuthService().signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.logout_rounded),
            )
          ],
        ),
      ),
    );
  }
}

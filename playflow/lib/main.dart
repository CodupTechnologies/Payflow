import 'dart:html';

import 'package:flutter/material.dart';
import 'package:playflow/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(AppFirebase());

}

class AppFirebase extends StatefulWidget {
  @override
  State<AppFirebase> createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {

    //tratamento de caso de exceção utilizando o FutureBuilder
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Material(
            child: Center(child: Text(
              "Não foi possível conectar à Database",
              textDirection: TextDirection.ltr,
            )),
          );
        }else if (snapshot.connectionState == ConnectionState.done){
          return AppWidget();
        }else{
          return Material(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      }
      );
  }
}
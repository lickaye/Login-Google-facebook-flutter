import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:reseausociallogin/facebook_login_controller.dart';
import 'package:reseausociallogin/fb_login_page.dart';
import 'package:reseausociallogin/google_login_controller.dart';
import 'package:reseausociallogin/login_controller.dart';
import 'package:reseausociallogin/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GoogleSignInContoller(),
          child: LoginPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => facebookSignInContoller(),
          child: FaceLoginPage(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(),
      ),
    );
  }
}

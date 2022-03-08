


import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInContoller with ChangeNotifier{

  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  login() async {
    this.googleAccount = await _googleSignIn.signIn();
    notifyListeners();
  }

  logout() async {
    this.googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}
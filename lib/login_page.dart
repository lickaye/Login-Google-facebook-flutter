import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reseausociallogin/facebook_login_controller.dart';
import 'package:reseausociallogin/google_login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),

      body: LoginUi(),
    );
  }

  LoginUi() {
    return Consumer<GoogleSignInContoller>(
      builder: (context, model, child) {
        if (model.googleAccount != null) {
          return Center(
            child: loggeedInUi(model),
          );
        } else {
          return LoginControls(context);
        }
      },
    );
  }

  loggeedInUi(GoogleSignInContoller model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage:
              Image.network(model.googleAccount!.photoUrl ?? '').image,
          radius: 50,
        ),
        Text(model.googleAccount!.displayName ?? ''),
        Text(model.googleAccount!.email),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {
            Provider.of<GoogleSignInContoller>(context,listen:false).logout();
          },
        )
      ],
    );
  }

  LoginControls(BuildContext context) {
    return Center(
      child: Column(
        children: [
          GestureDetector(
            child: Image.asset('images/google.jpg',width: 200,),

            onTap: (){
              Provider.of<GoogleSignInContoller>(context,listen:false).login();
            },
          ),
          GestureDetector(
            child: Image.asset('images/face.png',width: 200,),

            onTap: (){
              Provider.of<facebookSignInContoller>(context,listen:false).login();
            },
          ),
        ],
      ),
    );
  }
}

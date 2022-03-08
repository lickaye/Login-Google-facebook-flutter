import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reseausociallogin/google_login_controller.dart';

import 'facebook_login_controller.dart';

class FaceLoginPage extends StatefulWidget {
  const FaceLoginPage({Key? key}) : super(key: key);

  @override
  _FaceLoginPageState createState() => _FaceLoginPageState();
}

class _FaceLoginPageState extends State<FaceLoginPage> {
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
    return Consumer<facebookSignInContoller>(
      builder: (context, model, child) {
        if (model.userData != null) {
          return Center(
            child: loggeedInUi(model),
          );
        } else {
          return LoginControls(context);
        }
      },
    );
  }

  loggeedInUi(facebookSignInContoller model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(model.userData!['name'] ?? ''),
        Text(model.userData!['email']),
        ActionChip(
          avatar: Icon(Icons.logout),
          label: Text('Logout'),
          onPressed: () {
            Provider.of<facebookSignInContoller>(context,listen:false).logout();
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

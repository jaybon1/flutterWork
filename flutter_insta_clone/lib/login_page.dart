import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "인스타그램 클론",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(50.0)),
            SignInButton(Buttons.Google,
                onPressed: () => {
                      _handleSignIn().then((User? user) => {
                            if (user == null)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("로그인에 실패하였습니다.")))
                              }
                          })
                    }),
          ],
        ),
      ),
    );
  }

  Future<User?> _handleSignIn() async {
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleUser.authentication;
      UserCredential userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken));
      return userCredential.user;
    } else {
      return null;
    }
  }
}

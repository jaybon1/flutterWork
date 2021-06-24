import 'package:flutter/material.dart';
import 'package:flutter_getx_test/cross_import/social_login/social_login_controller.dart';
import 'package:get/get.dart';

class Login extends GetView<SocialLoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("asdf"),
            ElevatedButton(
              onPressed: () {
                controller.setSocialType("N");
                controller.socialLoginPopup();
              },
              child: Text('네이버 로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setSocialType("K");
                controller.socialLoginPopup();
              },
              child: Text('카카오 로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setSocialType("G");
                controller.socialLoginPopup();
              },
              child: Text('구글 로그인'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.setSocialType("A");
                controller.socialLoginPopup();
              },
              child: Text('애플 로그인'),
            ),
          ],
        ),
      ),
    );
  }
}

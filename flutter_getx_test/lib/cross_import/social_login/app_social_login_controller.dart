import 'dart:math';

import 'package:flutter_getx_test/cross_import/social_login/social_login_controller.dart';
import 'package:flutter_getx_test/dto/social_code_dto.dart';
import 'package:flutter_getx_test/dto/social_login_dto.dart';
import 'package:flutter_getx_test/utils/social_login_utils.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppSocialLoginController extends GetxController implements SocialLoginController {

  @override
  Rx<String> rxSocialType = Rx<String>("N");

  @override
  Rx<String?> rxState = Rx<String?>(null);

  @override
  Rx<Uri?> rxUri = Rx<Uri?>(null);

  @override
  Rx<SocialCodeDTO?> rxSocialCodeDTO = Rx<SocialCodeDTO?>(null);

  @override
  void setSocialType(String socialType) {
    rxSocialType.value = socialType;
  }

  @override
  void setupState() {
    var sb = StringBuffer();
    for (int i = 0; i < 10; i++) {
      sb.write(Random.secure().nextInt(100));
    }
    rxState.value = sb.toString();
  }

  @override
  void setUri() {}

  @override
  void socialLoginPopup() {
    // Get.to(() => WebViewPage());

    if(rxSocialType.value == "N"){

      _naverLogin();

    } else if(rxSocialType.value == "K"){

      _kakaoLogin();

    } else if(rxSocialType.value == "G"){

      _googleLogin();

    } else if(rxSocialType.value == "A"){

    }

  }

  @override
  void checkSocialCodeDTO(String data) { }

  void _naverLogin() async {
    NaverLoginResult res = await FlutterNaverLogin.logIn();

    // TODO 서버로 회원 여부 체크
    // TODO 회원 여부체크 후 회원가입 페이지 또는 메인페이지

    SocialLoginDTO socialLoginDTO = SocialLoginDTO(
        provider: "N",
        id: res.account.id
    );
    await SocialLoginUtils.loginCheck(socialLoginDTO);
  }

  void _kakaoLogin() async {
    NaverLoginResult res = await FlutterNaverLogin.logIn();

    // TODO 서버로 회원 여부 체크
    // TODO 회원 여부체크 후 회원가입 페이지 또는 메인페이지

    SocialLoginDTO socialLoginDTO = SocialLoginDTO(
        provider: "K",
        id: res.account.id
    );
    await SocialLoginUtils.loginCheck(socialLoginDTO);
  }

  void _googleLogin() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      clientId: '356304998840-o42dkqaeltbtama2bdheiirclfiboqhp.apps.googleusercontent.com'
    );
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();

    if(googleSignInAccount != null){
      print(googleSignInAccount);
    }


    // TODO 서버로 회원 여부 체크
    // TODO 회원 여부체크 후 회원가입 페이지 또는 메인페이지

    // SocialLoginDTO socialLoginDTO = SocialLoginDTO(
    //     provider: "K",
    //     id: res.account.id
    // );
    // await SocialLoginUtils.loginCheck(socialLoginDTO);
  }


}

SocialLoginController getController() => AppSocialLoginController();
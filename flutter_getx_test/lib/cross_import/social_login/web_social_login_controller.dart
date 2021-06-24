import 'dart:convert';
import 'dart:js' as js;
import 'dart:math';

import 'package:flutter_getx_test/cross_import/social_login/social_login_controller.dart';
import 'package:flutter_getx_test/dto/social_code_dto.dart';
import 'package:flutter_getx_test/utils/social_login_utils.dart';
import 'package:get/get.dart';

class WebSocialLoginController extends GetxController
    implements SocialLoginController {
  @override
  Rx<String> rxSocialType = Rx<String>("");

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
  void setUri() {
    setupState(); // 로그인 창을 모두 끄시고 다시 로그인요청 하세요.

    if (rxSocialType.value == "N") {
      Map<String, dynamic> queryParams = Map();
      queryParams['response_type'] = "code";
      queryParams['client_id'] = "qqoq10crroWmE1Yux6ZX";
      queryParams['redirect_uri'] =
          "http://localhost:8050/assets/naverCode.html";
      queryParams['state'] = rxState.value;

      rxUri.value = Uri(
          scheme: "https",
          host: "nid.naver.com",
          path: "oauth2.0/authorize",
          queryParameters: queryParams);

    } else if (rxSocialType.value == "K") {
      Map<String, dynamic> queryParams = Map();
      queryParams['response_type'] = "code";
      queryParams['client_id'] = "79f79d24d2f1f339724c007a9913ecba";
      queryParams['redirect_uri'] =
          "http://localhost:8050/assets/kakaoCode.html";
      queryParams['state'] = rxState.value;

      rxUri.value = Uri(
          scheme: "https",
          host: "kauth.kakao.com",
          path: "oauth/authorize",
          queryParameters: queryParams);

    } else if (rxSocialType.value == "G") {
      Map<String, dynamic> queryParams = Map();
      queryParams['response_type'] = "code permission id_token";
      queryParams['client_id'] =
          "356304998840-4mck7a1qc8fqa3ql14iokm4sr9nekngp.apps.googleusercontent.com";
      queryParams['redirect_uri'] =
          "http://localhost:8050/assets/googleCode.html";
      queryParams['state'] = rxState.value;
      queryParams['scope'] = "openid profile email";
      queryParams['openid.realm'] = "";
      queryParams['ss_domain'] = "http://localhost:8050";
      queryParams['access_type'] = "offline";
      queryParams['include_granted_scopes'] = "true";
      queryParams['prompt'] = "consent";
      queryParams['origin'] = "http://localhost:8050";
      queryParams['gsiwebsdk'] = "2";
      queryParams['flowName'] = "GeneralOAuthFlow";
      // queryParams['state'] = rxState.value;

      rxUri.value = Uri(
          scheme: "https",
          host: "accounts.google.com",
          path: "o/oauth2/auth/oauthchooseaccount",
          queryParameters: queryParams);

    } else {
      // TODO 경고메시지
      print("소셜타입을 설정해주세요.");
    }
  }

  @override
  void socialLoginPopup() {
    setUri();

    js.context['checkSocialCodeDTO'] = checkSocialCodeDTO;
    js.context.callMethod('open', [
      rxUri.value.toString(),
      "target=_blank",
      "width = 500, height = 500, top = 100, left = 200, location = no"
    ]);
  }

  @override
  void checkSocialCodeDTO(String data) {
    rxSocialCodeDTO.value = SocialCodeDTO.fromJson(json.decode(data));

    if (rxSocialCodeDTO.value == null ||
        rxSocialCodeDTO.value!.state != rxState.value) {
      // TODO state가 일치하지 않음
      // TODO 경고메시지(잘못된 요청입니다) 띄울지 고민
      return;
    }

    SocialLoginUtils.loginCheck(rxSocialCodeDTO.value!)
        .then((value) => print(value.body));
  }
}

SocialLoginController getController() => WebSocialLoginController();

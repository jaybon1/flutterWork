// 교차 import
// https://aschilken.medium.com/flutter-conditional-import-for-web-and-native-9ae6b5a5cd39

library social_login_controller;

import 'package:flutter_getx_test/dto/social_code_dto.dart';
import 'package:get/get.dart';

import 'social_login_controller_stub.dart'
  if(dart.library.io) 'app_social_login_controller.dart'
  if(dart.library.js) 'web_social_login_controller.dart';



abstract class SocialLoginController {
  factory SocialLoginController() => getController();

  // 제대로된 요청인지 확인하기 위한 코드 (직접생성)
  Rx<String?> rxState = Rx<String?>(null);
  
  // 로그인 처리를 위한 code를 저장하는 DTO
  Rx<SocialCodeDTO?> rxSocialCodeDTO = Rx<SocialCodeDTO?>(null);
  
  // 로그인 요청 Uri
  Rx<Uri?> rxUri = Rx<Uri?>(null);
  
  // 소셜로그인 타입 (네이버 카카오 구글 애플)
  Rx<String> rxSocialType = Rx<String>("");

  // 소셜타입 세팅
  void setSocialType(String socialType) {}

  // state 세팅
  void setupState() {}

  // 로그인 요청 Uri 세팅
  void setUri() {}

  // 로그인 창 팝업 또는 이동
  void socialLoginPopup() {}

  // 소셜 코드를 체크하는 메서드
  void checkSocialCodeDTO(String data) {}


}
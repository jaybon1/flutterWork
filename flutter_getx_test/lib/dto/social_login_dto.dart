import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_login_dto.freezed.dart';
part 'social_login_dto.g.dart';

@freezed
class SocialLoginDTO with _$SocialLoginDTO {
  factory SocialLoginDTO({
    required String provider,
    required String id
  }) = _SocialLoginDTO;

  factory SocialLoginDTO.fromJson(Map<String, dynamic> json) =>
      _$SocialLoginDTOFromJson(json);
}

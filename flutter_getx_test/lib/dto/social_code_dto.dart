import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_code_dto.freezed.dart';
part 'social_code_dto.g.dart';

@freezed
class SocialCodeDTO with _$SocialCodeDTO {
  factory SocialCodeDTO({
    required String provider,
    required String code,
    required String state,
  }) = _SocialCodeDTO;

  factory SocialCodeDTO.fromJson(Map<String, dynamic> json) =>
      _$SocialCodeDTOFromJson(json);
}

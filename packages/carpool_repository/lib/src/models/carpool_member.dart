import 'package:freezed_annotation/freezed_annotation.dart';

part 'carpool_member.freezed.dart';
part 'carpool_member.g.dart';

@freezed
class CarpoolMember with _$CarpoolMember {
  const factory CarpoolMember({
    required String id,
    required String name,
    required String email,
    required List<String> childrenNames,
  }) = _CarpoolMember;

  factory CarpoolMember.fromJson(Map<String, dynamic> json) =>
      _$CarpoolMemberFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'carpool.freezed.dart';
part 'carpool.g.dart';

@freezed
class Carpool with _$Carpool {
  const factory Carpool({
    required String id,
    required String name,
    required String location,
    required List<String> memberIds,
    required String pickupTime,
  }) = _Carpool;

  factory Carpool.fromJson(Map<String, dynamic> json) =>
      _$CarpoolFromJson(json);
}

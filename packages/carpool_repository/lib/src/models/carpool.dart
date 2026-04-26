import 'package:freezed_annotation/freezed_annotation.dart';

part 'carpool.freezed.dart';
part 'carpool.g.dart';

/// Domain model representing a carpool.
@freezed
class Carpool with _$Carpool {
  /// Creates a [Carpool].
  const factory Carpool({
    required String id,
    required String name,
    required String location,
    required List<String> memberIds,
    required String pickupTime,
  }) = _Carpool;

  /// Creates a [Carpool] from JSON.
  factory Carpool.fromJson(Map<String, dynamic> json) =>
      _$CarpoolFromJson(json);
}

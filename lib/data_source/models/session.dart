import 'package:json_annotation/json_annotation.dart';

import 'session_type.dart';

part 'session.g.dart';

@JsonSerializable(createToJson: false)
class Session {
  final String title;
  final SessionType type;
  final DateTime start;
  final DateTime? end;
  @JsonKey(defaultValue: [])
  final List<String> presenters;
  @JsonKey(defaultValue: [])
  final List<String> presentation;
  @JsonKey(defaultValue: [])
  final List<String> rooms;

  Session({
    required this.title,
    required this.type,
    required this.start,
    this.end,
    required this.presenters,
    required this.presentation,
    required this.rooms,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

import 'session_type.dart';

part 'session.g.dart';

@JsonSerializable(createToJson: false)
class Session {
  final String title;
  final SessionType type;
  final DateTime start;
  final DateTime? end;
  final List<String>? presenters;
  final List<String>? rooms;

  Session({
    required this.title,
    required this.type,
    required this.start,
    this.end,
    this.presenters,
    this.rooms,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

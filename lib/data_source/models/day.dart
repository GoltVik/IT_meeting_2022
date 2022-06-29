import 'package:json_annotation/json_annotation.dart';

import 'session.dart';

part 'day.g.dart';

@JsonSerializable(createToJson: false)
class Day {
  final String title;
  final DateTime date;
  final List<Session> sessions;

  const Day({
    required this.title,
    required this.date,
    required this.sessions,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);
}

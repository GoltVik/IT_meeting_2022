import 'package:json_annotation/json_annotation.dart';

import 'day.dart';

part 'event.g.dart';

@JsonSerializable(createToJson: false)
class Event {
  final List<Day> days;

  const Event({this.days = const []});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

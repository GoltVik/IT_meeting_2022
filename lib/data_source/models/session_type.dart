// ignore_for_file: constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum SessionType {
  sessions,
  food_break,
  coffee_break,
  day_end,
  event_end,
}

import 'package:flutter/material.dart';

class TimeLineWidget extends StatelessWidget {
  final DateTimeRange range;

  TimeLineWidget(
    DateTime start,
    DateTime? end, {
    Key? key,
  })  : range = DateTimeRange(
          start: start,
          end: start.add(const Duration(days: 1)),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      width: 8,
      thickness: 4,
    );
  }
}

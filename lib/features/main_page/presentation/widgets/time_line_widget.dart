import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeLineWidget extends StatelessWidget {
  final DateTimeRange range;
  final bool last;

  TimeLineWidget(
    DateTime start,
    DateTime? end, {
    Key? key,
    this.last = false,
  })  : range = DateTimeRange(
          start: start,
          end: end ?? start.add(const Duration(days: 1)),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _Point(date: range.start),
          if (!last)
            Expanded(
              child: VerticalDivider(
                width: 10,
                thickness: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
        ],
      ),
    );
  }
}

class _Point extends StatelessWidget {
  _Point({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;
  final formatter = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(formatter.format(date))),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

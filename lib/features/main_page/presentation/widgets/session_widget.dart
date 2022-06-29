import 'package:flutter/material.dart';
import 'package:it_meeting_2022/data_source/models/session.dart';

import '../../../../data_source/models/session_type.dart';
import 'time_line_widget.dart';

class SessionWidget extends StatelessWidget {
  final Session session;

  const SessionWidget(this.session, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: session.type == SessionType.sessions ? 140 : 90,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TimeLineWidget(session.start, session.end),
          Expanded(
            child: () {
              switch (session.type) {
                case SessionType.sessions:
                  return _sessionElement(context);

                case SessionType.food_break:
                  return _foodTimeElement(context);

                case SessionType.coffee_break:
                  return _coffeeTimeElement(context);

                case SessionType.day_end:
                  return _continuationElement(context);

                case SessionType.event_end:
                  return _endEventElement(context);
              }
            }(),
          )
        ],
      ),
    );
  }

  Widget _sessionElement(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              session.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodTimeElement(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.lunch_dining_outlined),
        Text(session.title),
      ],
    );
  }

  Widget _coffeeTimeElement(BuildContext context) {
    return const Icon(Icons.coffee);
  }

  Widget _continuationElement(BuildContext context) {
    return SizedBox.shrink();
  }

  Widget _endEventElement(BuildContext context) {
    return SizedBox.shrink();
  }
}

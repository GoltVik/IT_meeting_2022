import 'package:flutter/material.dart';
import 'package:it_meeting_2022/data_source/models/day.dart';

import '../../../../data_source/models/session.dart';
import 'session_widget.dart';

class DayScheduleWidget extends StatelessWidget {
  final List<Session> sessions;

  DayScheduleWidget(Day e, {Key? key})
      : sessions = e.sessions,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8.0, left: 16.0),
      itemBuilder: (context, index) => SessionWidget(sessions[index]),
      itemCount: sessions.length,
    );
  }
}

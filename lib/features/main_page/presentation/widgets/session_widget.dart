import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        maxHeight: session.type == SessionType.sessions ? 195 : 100,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TimeLineWidget(
            session.start,
            session.end,
            last: session.type == SessionType.event_end,
          ),
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
    return _SessionBackground(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            session.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            session.presenters.join(','),
            style: Theme.of(context).textTheme.caption,
          ),
          const Spacer(),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: 4.0,
            children: session.rooms
                .map((e) => RawChip(
                      label: Text(e),
                      backgroundColor:
                          Theme.of(context).colorScheme.primary.withOpacity(.3),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _foodTimeElement(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const Icon(Icons.restaurant, size: 35),
          const SizedBox(width: 8),
          Text(
            session.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _coffeeTimeElement(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          const Icon(Icons.coffee_maker_outlined, size: 35),
          const SizedBox(width: 8),
          Text(
            session.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _continuationElement(BuildContext context) {
    return _SessionBackground(
      child: Center(
        child: Text(
          session.title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _endEventElement(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            session.title,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            'Thank you to be there\nSee you next year!',
            style: GoogleFonts.indieFlower().copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class _SessionBackground extends StatelessWidget {
  final Widget? child;

  const _SessionBackground({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, left: 16.0),
      color: Theme.of(context).colorScheme.primary.withOpacity(.06),
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
      child: child,
    );
  }
}

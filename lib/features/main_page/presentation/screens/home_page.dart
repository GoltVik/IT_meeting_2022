import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:it_meeting_2022/data_source/models/event.dart';

import '../widgets/day_schedule_widget.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  Future<Event> loadAsset(BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final file = await bundle.loadString('assets/data/schedule.json');
    return Event.fromJson(jsonDecode(file));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Event>(
        future: loadAsset(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final event = snapshot.data!;
            return ResponsibleScheduleWidget(event: event);
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class ResponsibleScheduleWidget extends StatelessWidget {
  final Event event;

  const ResponsibleScheduleWidget({Key? key, required this.event})
      : super(key: key);

  Widget _sliverAppBar(BuildContext context, {List<Widget>? tabs}) {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.white,
      expandedHeight: 220,
      pinned: true,
      // snap: true,
      // floating: true,
      flexibleSpace: SafeArea(
        child: Center(child: Image.asset('assets/images/header.jpg')),
      ),
      bottom: tabs == null
          ? null
          : TabBar(
              tabs: tabs,
              labelStyle: const TextStyle(fontSize: 20),
              labelColor: Theme.of(context).colorScheme.primary,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      switch (orientation) {
        case Orientation.portrait:
          return DefaultTabController(
            length: event.days.length,
            child: CustomScrollView(
              slivers: [
                _sliverAppBar(
                  context,
                  tabs: event.days.map((e) => Tab(text: e.title)).toList(),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    children: event.days.map(DayScheduleWidget.new).toList(),
                  ),
                )
              ],
            ),
          );
        case Orientation.landscape:
          return CustomScrollView(
            slivers: [
              _sliverAppBar(context),
              SliverFillRemaining(
                child: Row(
                  children: event.days
                      .map(DayScheduleWidget.new)
                      .map((e) => Expanded(child: e))
                      .toList(),
                ),
              )
            ],
          );
      }
    });
  }
}

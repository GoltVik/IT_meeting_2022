import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:it_meeting_2022/data_source/models/event.dart';

import '../widgets/day_schedule_widget.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _sliverAppBar(List<Widget> tabs) {
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
      bottom: TabBar(tabs: tabs),
    );
  }

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
            return DefaultTabController(
              length: event.days.length,
              child: CustomScrollView(
                slivers: [
                  _sliverAppBar(
                    event.days.map((e) => Tab(text: e.title)).toList(),
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      children: event.days.map(DayScheduleWidget.new).toList(),
                    ),
                  )
                ],
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

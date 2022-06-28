import 'package:flutter/material.dart';

import '../features/main_page/presentation/screens/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IT Meeting 2022',
      theme: ThemeData(
        primarySwatch: const Color(0xFF076FBD).material,
        scaffoldBackgroundColor: const Color(0xFFF0F4F6),
      ),
      home: const HomePage(title: 'Schedule'),
    );
  }
}

extension on Color {
  MaterialColor get material {
    final swatch = {
      50: withOpacity(.1),
      100: withOpacity(.2),
      200: withOpacity(.3),
      300: withOpacity(.4),
      400: withOpacity(.5),
      500: withOpacity(.6),
      600: withOpacity(.7),
      700: withOpacity(.8),
      800: withOpacity(.9),
      900: withOpacity(1),
    };
    return MaterialColor(value, swatch);
  }
}

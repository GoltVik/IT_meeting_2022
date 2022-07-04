import 'package:flutter/material.dart';

import 'app/app.dart';
import 'none_url_strategy.dart' if (dart.library.html) 'web_url_strategy.dart';

void main() {
  configureUrl();

  runApp(const MyApp());
}

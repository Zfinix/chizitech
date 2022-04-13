import 'package:chizitech/views/landing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'utils/theme.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chizi.tech',
      theme: themeData(context),
      debugShowCheckedModeBanner: false,
      color: Colors.red,
      home: Landing(),
    );
  }
}

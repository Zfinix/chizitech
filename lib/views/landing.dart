import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home/home_phone.dart';
import 'home/home_tab.dart';
import 'home/home_web.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: Home(),
        tablet: HomeTab(),
        desktop: HomeWeb(),
      ),
    );
  }
}

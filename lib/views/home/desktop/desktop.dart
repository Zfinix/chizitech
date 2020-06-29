import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'dos_mobile.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: DosMobile(),
        tablet: Container(color: Colors.yellow),
        //  desktop: HomeWeb(),
      ),
    );
  }
}

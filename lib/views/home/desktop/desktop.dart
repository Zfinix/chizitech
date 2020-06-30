import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'dos_mobile.dart';
import 'dos_tab.dart';
import 'dos_web.dart';

class Desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        breakpoints: ScreenBreakpoints(tablet: 600, desktop: 990, watch: 300),
        mobile: DosMobile(),
        tablet: DosTab(),
        desktop: DosWeb(),
      ),
    );
  }
}

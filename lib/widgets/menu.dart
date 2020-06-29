import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MenuItem(
          'PORTFOLIO',
          onPressed: () async {
            
          },
        ),
        const XMargin(20),
        MenuItem(
          'CONTACT ME',
          onPressed: () async {
            await launch(Uri.parse('https://twitter.com/zfinix1').toString());
          },
        ),
        const XMargin(20),
        MenuItem(
          'RESUME',
          onPressed: () async {
            await launch(Uri.parse('https://docs.google.com/document/d/1J9yigOS1qymjM7fF0wTxpzlrIlM0DvpMQFK16JoEVhc/edit#').toString());
          },
        ),
        const XMargin(20),
        IconButton(
          icon: Icon(prov.isDark ? FeatherIcons.sun : FeatherIcons.moon),
          color: textColor(prov.isDark),
          iconSize: 14,
          onPressed: () {
            prov.isDark = !prov.isDark;
          },
        ),
      ],
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu/exp_menu.dart';

class Home extends HookWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Container(
      color: bgColor(prov.isDark),
      child: ListView(
        children: [
          Container(
            height: context.screenHeight(),
            width: context.screenWidth(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const YMargin(30),
                MobileMenu(),
                YMargin(context.screenHeight(0.08)),
                Hero(
                  tag: 'avatar',
                  child: Container(
                    height: context.screenWidth(0.4),
                    width: context.screenWidth(0.4),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: ExactAssetImage('assets/images/chizi.png'),
                      ),
                    ),
                  ),
                ),
                YMargin(context.screenHeight(0.08)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        'Hi, I’m Chiziaruhoma',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 25,
                            color: textColor(prov.isDark),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0),
                      ),
                      const YMargin(10),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Text(
                          'I design and build beautiful mobile and desktop experiences for fun.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              fontSize: 10,
                              color: textColor(prov.isDark).withOpacity(0.7),
                              fontWeight: FontWeight.w300,
                              height: 2,
                              letterSpacing: 1.1),
                        ),
                      ),
                    ],
                  ),
                ),
                YMargin(context.screenHeight(0.06)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 39,
                      child: FlatButton(
                        color: buttonColor(prov.isDark),
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        onPressed: () =>
                            navigate(context, EXPMenu(), isDialog: true),
                        child: Text(
                          'EXPLORE    >',
                          style: GoogleFonts.montserrat(
                              fontSize: 8,
                              letterSpacing: 1,
                              color: buttonTextColor(prov.isDark),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(FeatherIcons.github),
                      color: textColor(prov.isDark).withOpacity(0.7),
                      iconSize: 14,
                      onPressed: () async {
                        await launch(
                            Uri.parse('https://github.com/zfinix').toString());
                      },
                    ),
                    const XMargin(20),
                    IconButton(
                      icon: Icon(LineIcons.dribbble),
                      color: textColor(prov.isDark).withOpacity(0.7),
                      iconSize: 20,
                      onPressed: () async {
                        await launch(
                            Uri.parse('https://dribbble.com/chiziaruhoma')
                                .toString());
                      },
                    ),
                    const XMargin(20),
                    IconButton(
                      icon: Icon(FeatherIcons.twitter),
                      color: textColor(prov.isDark).withOpacity(0.7),
                      iconSize: 14,
                      onPressed: () async {
                        await launch(Uri.parse('https://twitter.com/zfinix1')
                            .toString());
                      },
                    ),
                  ],
                ),
                const YMargin(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'chizi.tech',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: textColor(prov.isDark).withOpacity(0.08),
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                YMargin(context.screenHeight(0.02)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MobileMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        MenuItem('PORTFOLIO', onPressed: () {}),
        const XMargin(10),
        MenuItem(
          'CONTACT ME',
          onPressed: () async {
            await launch(Uri.parse('https://twitter.com/zfinix14').toString());
          },
        ),
        const XMargin(10),
        MenuItem(
          'RESUME',
          onPressed: () async {
            await launch(Uri.parse(
                    'https://docs.google.com/document/d/1J9yigOS1qymjM7fF0wTxpzlrIlM0DvpMQFK16JoEVhc/edit#')
                .toString());
          },
        ),
        const XMargin(10),
        IconButton(
          icon: Icon(prov.isDark ? FeatherIcons.sun : FeatherIcons.moon),
          color: textColor(prov.isDark),
          iconSize: 14,
          onPressed: () {
            prov.isDark = !prov.isDark;
          },
        ),
        Spacer(),
      ],
    );
  }
}

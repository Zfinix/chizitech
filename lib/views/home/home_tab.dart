import 'package:auto_size_text/auto_size_text.dart';
import 'package:chizitech/core/viewmodels/home_vm.dart';
import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/spring_button.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:chizitech/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu/exp_menu.dart';

class HomeTab extends StatefulHookWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Container(
      height: context.screenHeight(),
      width: context.screenWidth(),
      color: bgColor(prov.isDark),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              XMargin(context.screenWidth(0.15)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'chizi.tech',
                      style: GoogleFonts.montserrat(
                          fontSize: 17,
                          color: textColor(prov.isDark),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const YMargin(20),
                  Menu(),
                  Spacer(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const YMargin(20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 200.0,
                            maxWidth: 240.0,
                            minHeight: 20.0,
                            maxHeight: 80.0,
                          ),
                          child: AutoSizeText(
                            'Hi,\nI’m Chiziaruhoma',
                            style: GoogleFonts.montserrat(
                                fontSize: 40,
                                color: textColor(prov.isDark),
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const YMargin(50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: context.screenWidth(0.38),
                        child: Text(
                          'I design and build beautiful mobile and desktop experiences for fun.',
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              color: textColor(prov.isDark).withOpacity(0.7),
                              fontWeight: FontWeight.w300,
                              height: 2,
                              letterSpacing: 1.1),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(20),
                  SubMenu(),
                  const YMargin(70),
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
                  Spacer(),
                ],
              ),
              XMargin(context.screenWidth(0.02)),
              Hero(
                tag: 'avatar',
                child: Container(
                  height: context.screenWidth(0.2),
                  width: context.screenWidth(0.2),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage('assets/images/chizi.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SubMenu extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SubButton(
          'https://github.com/zfinix',
          icon: Icon(
            FeatherIcons.github,
            color: textColor(prov.isDark).withOpacity(0.7),
            size: 14,
          ),
        ),
        const XMargin(25),
        SubButton(
          'https://dribbble.com/chiziaruhoma',
          icon: Icon(
            LineIcons.dribbble,
            color: textColor(prov.isDark).withOpacity(0.7),
            size: 20,
          ),
        ),
        const XMargin(25),
        SubButton(
          'https://twitter.com/zfinix1',
          icon: Icon(
            LineIcons.twitter,
            color: textColor(prov.isDark).withOpacity(0.7),
            size: 20,
          ),
        ),
        const XMargin(25),
        SubButton(
          'https://linkedin.com/in/chiziaruhoma',
          icon: Icon(
            FeatherIcons.linkedin,
            color: textColor(prov.isDark).withOpacity(0.7),
            size: 14,
          ),
        ),
      ],
    );
  }
}

class SubButton extends StatelessWidget {
  final String url;
  final Icon icon;

  SubButton(this.url, {this.icon});

  @override
  Widget build(BuildContext context) {
  
    return SpringButton(
      useCache: false,
      child: icon ?? Container(),
      onTap: () async {
        await launch(Uri.parse(url).toString());
      },
    );
  }
}


class MenuItem extends HookWidget {
  final Function onPressed;
  final String text;

  MenuItem(this.text, {this.onPressed});
  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text ?? '',
        style: GoogleFonts.montserrat(
            fontSize: 8.5,
            color: textColor(prov.isDark),
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2),
      ),
    ) /* .showCursorOnHover */;
  }
}

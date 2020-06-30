import 'package:chizitech/core/models/desktop_model.dart';
import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/utils/spring_button.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/utils/url.dart';
import 'package:chizitech/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home_web.dart';

class DosTab extends StatefulHookWidget {
  DosTab({Key key}) : super(key: key);

  @override
  _DosTabState createState() => _DosTabState();
}

class _DosTabState extends State<DosTab> {
  @override
  void initState() {
    providerMain.read(context).loadDataFromDB(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Container(
      height: context.screenHeight(),
      width: context.screenWidth(),
      color: bgColor(prov.isDark),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    XMargin(40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: context.screenWidth(.92),
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              Menu(),
                              Spacer(),
                              Hero(
                                tag: 'avatar',
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: ExactAssetImage(
                                          'assets/images/chizi.png'),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 30, 40, 0),
                  child: prov.dataModel != null
                      ? Container(
                          width: context.screenWidth(.92),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      prov.dataModel.desktop[prov.selectedIndex]
                                              ?.title ??
                                          '',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 30,
                                          color: textColor(prov.isDark),
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 0.2)),
                                  YMargin(10),
                                  Text(
                                    prov.dataModel.desktop[prov.selectedIndex]
                                            ?.desc ??
                                        '',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        color: textColor(prov.isDark)
                                            .withOpacity(0.3),
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 0.9),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 39,
                                child: FlatButton.icon(
                                  color: buttonColor(prov.isDark),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                  onPressed: () => launch(Uri.parse(prov
                                              .dataModel
                                              .desktop[prov.selectedIndex]
                                              ?.github ??
                                          'https://github.com/zfinix')
                                      .toString()),
                                  label: Text(
                                    'GITHUB    >',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 8,
                                        letterSpacing: 1,
                                        color: buttonTextColor(prov.isDark),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  icon: Icon(FeatherIcons.github,
                                      size: 14,
                                      color: buttonTextColor(prov.isDark)),
                                ),
                              ),
                              //  XMargin(20),
                            ],
                          ),
                        )
                      : Container(),
                ),
                YMargin(context.screenHeight(.1)),
                Expanded(
                  child: prov.dataModel != null
                      ? PageView(
                          controller: prov.controllerTab,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          onPageChanged: (i) {
                            prov.selectedIndex = i;
                          },
                          children: [
                            for (var i = 0;
                                i < prov.dataModel.desktop.length;
                                i++)
                              SpringButton(
                                useCache: false,
                                onTap: () {
                                  if (i != prov.selectedIndex)
                                    prov.controllerTab.animateToPage(i,
                                        curve: Curves.easeInOut,
                                        duration: Duration(milliseconds: 790));
                                },
                                child: i == prov.selectedIndex
                                    ? DosCardSelected(prov.dataModel.desktop[i])
                                    : DosCard(prov.dataModel.desktop[i]),
                              )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                height: context.screenHeight(.23),
                                width: context.screenHeight(.23),
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  valueColor: AlwaysStoppedAnimation(
                                      accent(prov.isDark)),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                YMargin(context.screenHeight(.01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuItem(
                      '<  PREV',
                      onPressed: () {
                        prov.prevDos(isTab: true);
                      },
                    ),
                    XMargin(context.screenHeight(.3)),
                    MenuItem(
                      'NEXT   >',
                      onPressed: () {
                        prov.nextDos(isTab: true);
                      },
                    ),
                    XMargin(context.screenHeight(.01)),
                  ],
                ),
                YMargin(context.screenHeight(.05)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DosCardSelected extends HookWidget {
  DosCardSelected(this.data);
  final DesktopModel data;

  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Hero(
                tag: data.img,
                child: Container(
                  height: context.screenHeight(0.3),
                  width: context.screenWidth(0.9),
                  decoration: BoxDecoration(
                    color: bgColor(prov.isDark),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: bgColor(!prov.isDark).withOpacity(0.6),
                        width: 4),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${APIUrl.baseurl}/${data.img}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DosCard extends HookWidget {
  DosCard(this.data);
  final DesktopModel data;

  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Hero(
            tag: data.img,
            child: Container(
              height: context.screenWidth(0.11),
              width: context.screenWidth(0.18),
              decoration: BoxDecoration(
                color: bgColor(prov.isDark),
                boxShadow: [
                  BoxShadow(
                    color: accent(prov.isDark).withOpacity(0.08),
                    blurRadius: 36,
                  )
                ],
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${APIUrl.baseurl}/${data.img}'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

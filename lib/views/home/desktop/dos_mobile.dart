import 'package:chizitech/core/models/desktop_model.dart';
import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/spring_button.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/utils/url.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home_phone.dart';

class DosMobile extends StatefulHookWidget {
  @override
  _DosMobileState createState() => _DosMobileState();
}

class _DosMobileState extends State<DosMobile> {
  @override
  void initState() {
    providerMain.read(context).loadDataFromDB(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return Scaffold(
      backgroundColor: bgColor(prov.isDark),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const YMargin(30),
              GestureDetector(
                onTap: () => popView(context),
                child: Hero(
                  tag: 'avatar',
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: ExactAssetImage('assets/images/chizi.png'),
                      ),
                    ),
                  ),
                ),
              ),
              const YMargin(30),
              MobileMenu(),
              const YMargin(10),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                if (prov.dataModel != null)
                  for (var item in prov.dataModel.desktop) DosItem(item),
                const YMargin(30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DosItem extends HookWidget {
  DosItem(this.data);
  final DesktopModel data;

  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return SpringButton(
      onTap: () {},
      useCache: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Container(
          width: context.screenWidth(0.87),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: data.img,
                    child: Container(
                      height: context.screenHeight(0.26),
                      width: context.screenWidth(0.87),
                      decoration: BoxDecoration(
                        color: buttonColor(prov.isDark),
                        borderRadius: BorderRadius.circular(4),
                        border: prov.isDark
                            ? Border.all(color: bgColor(prov.isDark), width: 1)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color:
                                (prov.isDark ? Colors.grey : Colors.grey[900])
                                    .withOpacity(.2),
                            blurRadius: 10,
                          )
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('${APIUrl.baseurl}/${data.img}'),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 39,
                              width: 39,
                              child: FlatButton(
                                padding: EdgeInsets.all(5),
                                color: prov.isDark ? accent(true) : white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)),
                                onPressed: () => launch(Uri.parse(prov
                                            .dataModel
                                            .desktop[prov.selectedIndex]
                                            ?.github ??
                                        'https://github.com/zfinix')
                                    .toString()),
                                child: Icon(FeatherIcons.github,
                                    size: 14,
                                    color: buttonTextColor(prov.isDark)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const YMargin(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data?.title ?? '',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 18,
                              color: textColor(prov.isDark),
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.2)),
                      YMargin(6),
                      Text(
                        data?.desc ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            fontSize: 11,
                            color: textColor(prov.isDark).withOpacity(0.3),
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

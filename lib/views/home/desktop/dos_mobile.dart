import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/spring_button.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../home_phone.dart';

class DosMobile extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final prov = useProvider(providerMain);
    return  Scaffold(
        backgroundColor: bgColor(prov.isDark),
        body: ListView(
          children: [
            Container(
              height: context.screenHeight(),
              width: context.screenWidth(),
              child: Column(
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
                  Spacer(),
                  SpringButton(
                    onTap: () {},
                    useCache: false,
                    child: Text(
                      'Web',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: textColor(prov.isDark),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0),
                    ),
                  ),
                  const YMargin(30),
                  SpringButton(
                    onTap: () {},
                    useCache: false,
                    child: Text(
                      'Desktop',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 25,
                          color: textColor(prov.isDark),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.0),
                    ),
                  ),
                  const YMargin(30),
                  SpringButton(
                    onTap: () {},
                    useCache: false,
                    child: Text(
                      'Mobile',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: textColor(prov.isDark),
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
 
    );
  }
}

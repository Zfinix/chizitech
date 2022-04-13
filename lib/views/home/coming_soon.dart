import 'package:gap/gap.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/spring_button.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:flutter/material.dart';
import 'package:chizitech/utils/margin.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_phone.dart';

class ComingSoon extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);

    return Scaffold(
      backgroundColor: bgColor(viewModel.isDark),
      body: ListView(
        children: [
          Container(
            height: context.screenHeight(),
            width: context.screenWidth(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(30),
                GestureDetector(
                  onTap: () => popToFirst(context),
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
                const Gap(20),
                MobileMenu(),
                Spacer(),
                SpringButton(
                  onTap: () {},
                  useCache: false,
                  child: Text(
                    'Coming ',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: 15,
                        color: textColor(viewModel.isDark),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0),
                  ),
                ),
                const Gap(30),
                SpringButton(
                  onTap: () {},
                  useCache: false,
                  child: Text(
                    'Soon',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                        fontSize: 55,
                        color: textColor(viewModel.isDark),
                        fontWeight: FontWeight.w600,
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

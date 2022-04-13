import 'package:auto_size_text/auto_size_text.dart';
import 'package:chizitech/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:chizitech/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:chizitech/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'menu/exp_menu.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
    return Container(
      color: bgColor(viewModel.isDark),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
              MobileMenu(),
              Gap(context.screenHeight(0.05)),
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
              Gap(context.screenHeight(0.04)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Hi, I’m Chiziaruhoma',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontSize: 35,
                        color: textColor(viewModel.isDark),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Text(
                        'Poised, professional, and product-oriented Mobile Engineer with 5+ years of experience working in a variety of fast-paced, dynamic, and ever-changing settings. Experience includes working with and leading teams in building and designing beautiful User Interfaces',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                          fontSize: 14,
                          color: textColor(viewModel.isDark).withOpacity(0.7),
                          fontWeight: FontWeight.w400,
                          height: 2,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(context.screenHeight(0.06)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: ChiziButton(
                  color: buttonColor(viewModel.isDark),
                  onTap: () => navigate(context, EXPMenu(), isDialog: true),
                  text: 'Explore',
                ),
              ),
              Gap(context.screenHeight(0.02)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(FeatherIcons.github),
                    color: textColor(viewModel.isDark).withOpacity(0.7),
                    iconSize: 14,
                    onPressed: () async {
                      await launch(
                          Uri.parse('https://github.com/zfinix').toString());
                    },
                  ),
                  const Gap(20),
                  IconButton(
                    icon: Icon(LineIcons.dribbble),
                    color: textColor(viewModel.isDark).withOpacity(0.7),
                    iconSize: 20,
                    onPressed: () async {
                      await launch(
                          Uri.parse('https://dribbble.com/chiziaruhoma')
                              .toString());
                    },
                  ),
                  const Gap(20),
                  IconButton(
                    icon: Icon(FeatherIcons.twitter),
                    color: textColor(viewModel.isDark).withOpacity(0.7),
                    iconSize: 14,
                    onPressed: () async {
                      await launch(Uri.parse('https://twitter.com/chiziaruhoma')
                          .toString());
                    },
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'chizi.tech',
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: textColor(viewModel.isDark).withOpacity(0.08),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(context.screenHeight(0.02)),
            ],
          ),
        ],
      ),
    );
  }
}

class MobileMenu extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        MenuItem('PORTFOLIO', onTap: () {}),
        const Gap(10),
        MenuItem(
          'CONTACT ME',
          onTap: () async {
            await launch(Uri.parse('https://twitter.com/zfinix14').toString());
          },
        ),
        const Gap(10),
        MenuItem(
          'RESUME',
          onTap: () async {
            await launch(Uri.parse(
                    'https://docs.google.com/document/d/1J9yigOS1qymjM7fF0wTxpzlrIlM0DvpMQFK16JoEVhc/edit#')
                .toString());
          },
        ),
        const Gap(10),
        IconButton(
          icon: Icon(viewModel.isDark ? FeatherIcons.sun : FeatherIcons.moon),
          color: textColor(viewModel.isDark),
          iconSize: 14,
          onPressed: () {
            viewModel.isDark = !viewModel.isDark;
          },
        ),
        Spacer(),
      ],
    );
  }
}

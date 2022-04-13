import 'package:auto_size_text/auto_size_text.dart';
import 'package:chizitech/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/spring_button.dart';
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

class HomeTab extends StatefulHookConsumerWidget {
  HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(mainVM);
    return Container(
      height: context.screenHeight(),
      width: context.screenWidth(),
      color: bgColor(viewModel.isDark),
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Gap(context.screenWidth(0.15)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'chizi.tech',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        color: textColor(viewModel.isDark),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const Gap(20),
                  Menu(),
                  Spacer(),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Gap(20),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 200.0,
                            maxWidth: 240.0,
                            minHeight: 20.0,
                            maxHeight: 80.0,
                          ),
                          child: AutoSizeText(
                            'Hi,\nI’m Chiziaruhoma',
                            style: GoogleFonts.raleway(
                                fontSize: 45,
                                color: textColor(viewModel.isDark),
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: context.screenWidth(0.38),
                        child: Text(
                          'Poised, professional, and product-oriented Mobile Engineer with 5+ years of experience working in a variety of fast-paced, dynamic, and ever-changing settings. Experience includes working with and leading teams in building and designing beautiful User Interfaces',
                          style: GoogleFonts.raleway(
                              fontSize: 14,
                              color:
                                  textColor(viewModel.isDark).withOpacity(0.7),
                              fontWeight: FontWeight.w300,
                              height: 2,
                              letterSpacing: 1.1),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  SubMenu(),
                  const Gap(70),
                  ChiziButton(
                    color: buttonColor(viewModel.isDark),
                    onTap: () => navigate(context, EXPMenu(), isDialog: true),
                    text: 'Explore',
                  ),
                  Spacer(),
                ],
              ),
              Gap(context.screenWidth(0.02)),
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

class SubMenu extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SubButton(
          'https://github.com/zfinix',
          icon: Icon(
            FeatherIcons.github,
            color: textColor(viewModel.isDark).withOpacity(0.7),
            size: 14,
          ),
        ),
        const Gap(25),
        SubButton(
          'https://dribbble.com/chiziaruhoma',
          icon: Icon(
            LineIcons.dribbble,
            color: textColor(viewModel.isDark).withOpacity(0.7),
            size: 20,
          ),
        ),
        const Gap(25),
        SubButton(
          'https://twitter.com/chiziaruhoma',
          icon: Icon(
            LineIcons.twitter,
            color: textColor(viewModel.isDark).withOpacity(0.7),
            size: 20,
          ),
        ),
        const Gap(25),
        SubButton(
          'https://linkedin.com/in/chiziaruhoma',
          icon: Icon(
            FeatherIcons.linkedin,
            color: textColor(viewModel.isDark).withOpacity(0.7),
            size: 14,
          ),
        ),
      ],
    );
  }
}

class SubButton extends StatelessWidget {
  final String url;
  final Icon? icon;

  SubButton(this.url, {this.icon});

  @override
  Widget build(BuildContext context) {
    return SpringButton(
      useCache: false,
      child: icon ?? const Offstage(),
      onTap: () async {
        await launch(Uri.parse(url).toString());
      },
    );
  }
}

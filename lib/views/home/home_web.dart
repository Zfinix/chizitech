import 'package:auto_size_text/auto_size_text.dart';
import 'package:chizitech/core/viewmodels/home_vm.dart';
import 'package:chizitech/widgets/button.dart';
import 'package:gap/gap.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:chizitech/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_tab.dart';
import 'menu/exp_menu.dart';

final mainVM = ChangeNotifierProvider((_) => HomeVM());

class HomeWeb extends StatefulHookConsumerWidget {
  HomeWeb({Key? key}) : super(key: key);

  @override
  _HomeWebState createState() => _HomeWebState();
}

class _HomeWebState extends ConsumerState<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(mainVM);
    return Container(
      height: context.screenHeight(),
      width: context.screenWidth(),
      color: bgColor(viewModel.isDark),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(40),
            child: Material(
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    'chizi.tech',
                    style: GoogleFonts.raleway(
                      fontSize: 18,
                      color: textColor(viewModel.isDark),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              children: [
                Gap(context.screenWidth(0.15)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              minWidth: 300.0,
                              maxWidth: 540.0,
                              minHeight: 40.0,
                              maxHeight: 130.0,
                            ),
                            child: AutoSizeText(
                              'Hi,\nI’m Chiziaruhoma',
                              style: GoogleFonts.raleway(
                                  fontSize: 50,
                                  color: textColor(viewModel.isDark),
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.2),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(40),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: context.screenWidth(0.37),
                          child:  Text(
                            'Poised, professional, and product-oriented Mobile Engineer with 5+ years of experience working in a variety of fast-paced, dynamic, and ever-changing settings. Experience includes working with and leading teams in building and designing beautiful User Interfaces',
                            style: GoogleFonts.raleway(
                              fontSize: 19,
                              color:
                                  textColor(viewModel.isDark).withOpacity(0.7),
                              fontWeight: FontWeight.w400,
                              height: 2,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(40),
                    SubMenu(),
                    const Gap(70),
                    ChiziButton(
                      color: buttonColor(viewModel.isDark),
                      onTap: () =>
                          navigate(context, EXPMenu(), isDialog: true),
                      text: 'Explore',
                    ),
                    Spacer(),
                  ],
                ),
                Gap(context.screenWidth(0.2)),
                Hero(
                  tag: 'avatar',
                  child: Container(
                    height: context.screenWidth(0.18),
                    width: context.screenWidth(0.18),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: ExactAssetImage('assets/images/chizi.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

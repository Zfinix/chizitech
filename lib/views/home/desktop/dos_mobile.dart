import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:chizitech/core/models/desktop_model.dart';
import 'package:chizitech/utils/navigator.dart';
import 'package:chizitech/utils/spring_button.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/utils/url.dart';
import 'package:chizitech/views/home/home_phone.dart';
import 'package:chizitech/views/home/home_web.dart';

class DosMobile extends StatefulHookConsumerWidget {
  @override
  _DosMobileState createState() => _DosMobileState();
}

class _DosMobileState extends ConsumerState<DosMobile> {
  @override
  void initState() {
    ref.read(mainVM).loadDataFromDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(mainVM);
    return Scaffold(
      backgroundColor: bgColor(viewModel.isDark),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(30),
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
              const Gap(30),
              MobileMenu(),
              const Gap(10),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                for (var item in viewModel.dataModel.desktop) DosItem(item),
                const Gap(30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DosItem extends HookConsumerWidget {
  DosItem(this.data);
  final DesktopModel data;

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
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
                        color: buttonColor(viewModel.isDark),
                        borderRadius: BorderRadius.circular(4),
                        border: viewModel.isDark
                            ? Border.all(
                                color: bgColor(viewModel.isDark), width: 1)
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: (viewModel.isDark
                                    ? Colors.grey
                                    : Colors.grey[900])!
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
                              padding: EdgeInsets.all(5),
                              child: TouchableOpacity(
                                onTap: () => launch(Uri.parse(viewModel
                                            .dataModel
                                            .desktop[viewModel.selectedIndex]
                                            .github ??
                                        'https://github.com/zfinix')
                                    .toString()),
                                child: Icon(
                                  FeatherIcons.github,
                                  size: 14,
                                  color: buttonTextColor(viewModel.isDark),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.raleway(
                              fontSize: 18,
                              color: textColor(viewModel.isDark),
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.2)),
                      Gap(6),
                      Text(
                        data.desc,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(
                            fontSize: 11,
                            color: textColor(viewModel.isDark).withOpacity(0.3),
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

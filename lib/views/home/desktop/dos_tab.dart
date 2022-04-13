import 'package:chizitech/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:chizitech/core/models/desktop_model.dart';
import 'package:chizitech/utils/margin.dart';
import 'package:chizitech/utils/spring_button.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/utils/url.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:chizitech/widgets/menu.dart';

class DosTab extends StatefulHookConsumerWidget {
  DosTab({Key? key}) : super(key: key);

  @override
  _DosTabState createState() => _DosTabState();
}

class _DosTabState extends ConsumerState<DosTab> {
  @override
  void initState() {
    ref.read(mainVM).loadDataFromDB();
    super.initState();
  }

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
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Gap(40),
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
                  child: viewModel.dataModel.desktop.isNotEmpty
                      ? Container(
                          width: context.screenWidth(.92),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      viewModel
                                          .dataModel
                                          .desktop[viewModel.selectedIndex]
                                          .title,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.raleway(
                                          fontSize: 30,
                                          color: textColor(viewModel.isDark),
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 0.2)),
                                  Gap(10),
                                  Text(
                                    viewModel.dataModel
                                        .desktop[viewModel.selectedIndex].desc,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.raleway(
                                        fontSize: 12,
                                        color: textColor(viewModel.isDark)
                                            .withOpacity(0.3),
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 0.9),
                                  ),
                                ],
                              ),
                              Spacer(),
                              ChiziButton(
                                color: buttonColor(viewModel.isDark),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                onTap: () => launch(Uri.parse(viewModel
                                            .dataModel
                                            .desktop[viewModel.selectedIndex]
                                            .github ??
                                        'https://github.com/zfinix')
                                    .toString()),
                                text: 'GITHUB',
                              ),
                              //  Gap(20),
                            ],
                          ),
                        )
                      : const Offstage(),
                ),
                Gap(context.screenHeight(.1)),
                Expanded(
                  child: viewModel.dataModel.desktop.isNotEmpty
                      ? PageView(
                          controller: viewModel.controllerTab,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          onPageChanged: (i) {
                            viewModel.selectedIndex = i;
                          },
                          children: [
                            for (var i = 0;
                                i < viewModel.dataModel.desktop.length;
                                i++)
                              SpringButton(
                                useCache: false,
                                onTap: () {
                                  if (i != viewModel.selectedIndex)
                                    viewModel.controllerTab.animateToPage(i,
                                        curve: Curves.easeInOut,
                                        duration: Duration(milliseconds: 790));
                                },
                                child: i == viewModel.selectedIndex
                                    ? DosCardSelected(
                                        viewModel.dataModel.desktop[i])
                                    : DosCard(viewModel.dataModel.desktop[i]),
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
                                      accent(viewModel.isDark)),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                Gap(context.screenHeight(.01)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MenuItem(
                      '<  PREV',
                      onTap: () {
                        viewModel.prevDos(isTab: true);
                      },
                    ),
                    Gap(context.screenHeight(.3)),
                    MenuItem(
                      'NEXT   >',
                      onTap: () {
                        viewModel.nextDos(isTab: true);
                      },
                    ),
                    Gap(context.screenHeight(.01)),
                  ],
                ),
                Gap(context.screenHeight(.05)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DosCardSelected extends HookConsumerWidget {
  DosCardSelected(this.data);
  final DesktopModel data;

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
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
                    color: bgColor(viewModel.isDark),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: bgColor(!viewModel.isDark).withOpacity(0.6),
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

class DosCard extends HookConsumerWidget {
  DosCard(this.data);
  final DesktopModel data;

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
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
                color: bgColor(viewModel.isDark),
                boxShadow: [
                  BoxShadow(
                    color: accent(viewModel.isDark).withOpacity(0.08),
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

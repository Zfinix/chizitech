import 'package:chizitech/widgets/touchable_opacity.dart';
import 'package:gap/gap.dart';
import 'package:chizitech/utils/theme.dart';
import 'package:chizitech/views/home/home_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MenuItem(
          'PORTFOLIO',
          onTap: () async {},
        ),
        const Gap(20),
        MenuItem(
          'CONTACT ME',
          onTap: () async {
            await launch(
                Uri.parse('https://twitter.com/chiziaruhoma').toString());
          },
        ),
        const Gap(20),
        MenuItem(
          'RESUME',
          onTap: () async {
            await launch(Uri.parse(
                    'https://docs.google.com/document/d/1J9yigOS1qymjM7fF0wTxpzlrIlM0DvpMQFK16JoEVhc/edit#')
                .toString());
          },
        ),
        const Gap(20),
        IconButton(
          icon: Icon(viewModel.isDark ? FeatherIcons.sun : FeatherIcons.moon),
          color: textColor(viewModel.isDark),
          iconSize: 14,
          onPressed: () {
            viewModel.isDark = !viewModel.isDark;
          },
        ),
      ],
    );
  }
}

class MenuItem extends HookConsumerWidget {
  final VoidCallback? onTap;
  final String text;

  MenuItem(this.text, {this.onTap});

  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(mainVM);
    return TouchableOpacity(
      onTap: onTap,
      child: Text(
        text,
        style: GoogleFonts.raleway(
          fontSize: 9,
          color: textColor(viewModel.isDark),
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
        ),
      ),
    ) /* .showCursorOnHover */;
  }
}

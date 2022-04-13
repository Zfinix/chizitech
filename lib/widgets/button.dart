import 'package:chizitech/widgets/touchable_opacity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChiziButton extends StatelessWidget {
  const ChiziButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.color,
    this.textColor,
    this.borderColor,
    this.fontSize,
    this.enabled = true,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onTap;
  final double? width, height, fontSize;
  final String text;
  final EdgeInsetsGeometry? padding;
  final bool enabled;
  final Color? color, textColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: enabled ? 1.0 : 0.3,
      duration: const Duration(milliseconds: 250),
      child: SizedBox(
        width: width,
        height: height,
        child: TouchableOpacity(
          onTap: enabled ? onTap : null,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(32),
            border: borderColor != null
                ? Border.all(
                    color: borderColor!,
                  )
                : null,
          ),
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.raleway(
                    fontSize: fontSize ?? 14,
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

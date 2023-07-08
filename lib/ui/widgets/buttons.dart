import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final double fontSize;
  final bool isRounded;
  final VoidCallback? onPressed;

  const CustomFilledButton({
    super.key,
    required this.title,
    this.fontSize = 16,
    this.width = double.infinity,
    this.height = 50,
    this.isRounded = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: lightGreenColor,
          shape: (isRounded)
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                )
              : null,
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: fontSize,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: darkGreenTextStyle.copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

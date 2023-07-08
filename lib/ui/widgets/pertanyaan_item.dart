import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class PertanyaanItem extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const PertanyaanItem({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: greenColor,
            ),
          ],
        ),
      ),
    );
  }
}

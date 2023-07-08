import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class PenawaranItem extends StatelessWidget {
  final String title;
  final String gambar;
  final VoidCallback? onPressed;

  const PenawaranItem({
    super.key,
    required this.title,
    required this.gambar,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        width: 118,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              gambar,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
            Text(
              'Detail',
              style: lightGreenTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

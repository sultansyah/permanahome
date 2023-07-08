import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class RiwayatItem extends StatelessWidget {
  final String title;
  final String tanggal;
  final VoidCallback? onPressed;

  const RiwayatItem({
    super.key,
    required this.title,
    required this.tanggal,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(
            Icons.history,
            size: 30,
            color: greenColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  tanggal,
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

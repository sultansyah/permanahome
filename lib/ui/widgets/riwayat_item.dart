import 'package:flutter/material.dart';
import 'package:permanahome/models/riwayat_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/detail_riwayat_page.dart';

class RiwayatItem extends StatelessWidget {
  final Riwayat riwayat;

  const RiwayatItem({
    super.key,
    required this.riwayat,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailRiwayatPage(riwayat: riwayat),
          ),
        );
      },
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
                  riwayat.deskripsi ?? '',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                Text(
                  riwayat.createdAt ?? '',
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

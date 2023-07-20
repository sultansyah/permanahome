import 'package:flutter/material.dart';
import 'package:permanahome/models/notifikasi_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/detail_notifikasi_page.dart';

class NotifikasiItem extends StatelessWidget {
  final Notifikasi notifikasi;

  const NotifikasiItem({
    super.key,
    required this.notifikasi,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailNotifikasiPage(notifikasi: notifikasi),
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
                  notifikasi.pesan ?? '',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                Text(
                  notifikasi.createdAt ?? '',
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

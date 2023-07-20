import 'package:flutter/material.dart';
import 'package:permanahome/models/riwayat_model.dart';
import 'package:permanahome/shared/theme.dart';

class DetailRiwayatPage extends StatelessWidget {
  final Riwayat riwayat;

  const DetailRiwayatPage({
    super.key,
    required this.riwayat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  riwayat.createdAt ?? '-',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Status: ${riwayat.status ?? '-'}',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Tanggal Penyelesaian: ${riwayat.tanggalDiselesaikan ?? "-"}',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Permana Home Number: ${riwayat.permanaHomeNumberId ?? '-'}',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Deskripsi',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  riwayat.deskripsi ?? '-',
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
                  ),
                ),
                const Divider(),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Tindakan yang Diambil',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  riwayat.tindakan ?? '-',
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: medium,
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

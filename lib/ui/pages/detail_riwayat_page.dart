import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class DetailRiwayatPage extends StatelessWidget {
  // final String title;
  // final String status;
  // final String tanggalPenyelesain;
  // final String nama;
  // final String permanaHomeNumber;
  // final String deskripsi;
  // final String tindakanYangDiambil;

  const DetailRiwayatPage({
    super.key,
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
                  'Upgrade Layanan',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Status: Selesai',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Tanggal Penyelesain: 23 Juni 2023',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Alamat: Jalan Jalan Ke Tepi Pantai, Ini Bukan Pantun',
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
                  'Nama: Saya Siap',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Permana Home Number: 1221021210',
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
                  'Saya sudah selesai menyelesain upgrade layanan',
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
                  'Tindakan yang Diambil',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  'Menupgrade dan blabla blabla blabla blabla blabla blabla blabla blabla blabla blabla blabla',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
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

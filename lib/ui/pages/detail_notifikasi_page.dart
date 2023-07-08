import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class DetailNotifikasiPage extends StatelessWidget {
  // final String title;
  // final String status;
  // final String tanggalPenyelesain;
  // final String nama;
  // final String permanaHomeNumber;
  // final String deskripsi;
  // final String tindakanYangDiambil;

  const DetailNotifikasiPage({
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
                  'Upgrade Layanan Berhasil',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '12 Juni 2023',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Upgrade Layanan Anda Berhasil Dilakukan, Selamat Menikmati',
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

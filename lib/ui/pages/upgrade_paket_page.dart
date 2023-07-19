import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class UpgradePaketPage extends StatelessWidget {
  const UpgradePaketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade Speed'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Perlu Koneksi yang Lebih Cepat? Tingkatkan Sekarang Layanan Anda',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  'Tingkatkan koneksi Anda untuk kecepatan yang lebih tinggi dengan segera mengupgrade paket layanan Anda. Nikmati pengalaman online yang lebih lancar dan akses konten dengan lebih cepat. Jangan lewatkan kesempatan untuk memperbaiki koneksi internet Anda dengan melakukan upgrade paket sekarang.',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: lightGreenColor,
                    ),
                    child: Column(
                      children: [
                        // PaketItem(
                        //   namaPaket: 'Lite',
                        //   kecepatan: '25 Down & 10 Mbps Up',
                        //   paketLayanan: state.paketLayanan[0],
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // PaketItem(
                        //   namaPaket: 'Smart',
                        //   kecepatan: '50 Down & 20 Mbps Up',
                        //   paketLayanan: state.paketLayanan[1],
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        // PaketItem(
                        //   namaPaket: 'HAPPY',
                        //   kecepatan: '100 Down & 30 Mbps Up',
                        //   paketLayanan: state.paketLayanan[2],
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

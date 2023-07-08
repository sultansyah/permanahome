import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 10,
            ),
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Selamat datang di aplikasi ini! ',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Aplikasi ini didedikasikan untuk memberikan akses mudah dan cepat kepada pelanggan PT. Medianusa Permana terkait layanan jaringan internet unggulan kami, yang dikenal sebagai Permana Home.\nPermana Home adalah salah satu layanan utama yang ditawarkan oleh PT. Medianusa Permana. Kami bangga menyediakan jaringan internet berkualitas tinggi yang dirancang untuk memenuhi kebutuhan komunikasi dan konektivitas Anda. Dengan aplikasi ini, Anda akan dapat mengeksplorasi dan mendapatkan informasi terperinci mengenai layanan Permana Home.\nTerima kasih sudah menggunakan aplikasi ini.',
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

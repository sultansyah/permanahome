import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class BeritaPage extends StatelessWidget {
  final String title;
  final String konten;
  final String tanggal;
  final String gambar;

  const BeritaPage({
    super.key,
    required this.title,
    required this.konten,
    required this.tanggal,
    required this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 2,
                ),
                child: Image.asset(
                  'assets/ic_kalender.png',
                  width: 15,
                ),
              ),
              Text(
                tanggal,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Image.asset(
            gambar,
            width: 313,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            konten,
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

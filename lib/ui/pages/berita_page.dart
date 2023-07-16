import 'package:flutter/material.dart';
import 'package:permanahome/models/berita_model.dart';
import 'package:permanahome/shared/theme.dart';

class BeritaPage extends StatelessWidget {
  final BeritaModel berita;

  const BeritaPage({
    super.key,
    required this.berita,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(berita.judul ?? ''),
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
                berita.createdAt ?? '',
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
          Image.network(
            berita.gambar ?? '',
            height: 306,
            width: 184,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            berita.judul ?? '',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            berita.konten ?? '',
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:permanahome/models/pertanyaan_model.dart';
import 'package:permanahome/shared/theme.dart';

class DetailPertanyaan extends StatelessWidget {
  final Pertanyaan pertanyaan;

  const DetailPertanyaan({
    super.key,
    required this.pertanyaan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertanyaan'),
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
                pertanyaan.createdAt ?? '',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            color: whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  pertanyaan.judul ?? '',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  pertanyaan.konten ?? '',
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

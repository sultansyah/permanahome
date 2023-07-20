import 'package:flutter/material.dart';
import 'package:permanahome/models/notifikasi_model.dart';
import 'package:permanahome/shared/theme.dart';

class DetailNotifikasiPage extends StatelessWidget {
  final Notifikasi notifikasi;

  const DetailNotifikasiPage({
    super.key,
    required this.notifikasi,
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
                  notifikasi.createdAt ?? '',
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  notifikasi.pesan ?? '',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

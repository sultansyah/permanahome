import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/notifikasi_item.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 18,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                NotifikasiItem(
                  title: 'Upgrade Layanan Berhasil',
                  tanggal: '21 Juni 2023',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-notifikasi');
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                const Divider(),
                NotifikasiItem(
                  title: 'Upgrade Layanan Berhasil',
                  tanggal: '21 Juni 2023',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-notifikasi');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

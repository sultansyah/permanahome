import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/riwayat_item.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat'),
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
                RiwayatItem(
                  title: 'Upgrade Layanan',
                  tanggal: '21 Juni 2023',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-riwayat');
                  },
                ),
                const SizedBox(
                  height: 18,
                ),
                const Divider(),
                RiwayatItem(
                  title: 'Upgrade Layanan',
                  tanggal: '21 Juni 2023',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-riwayat');
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

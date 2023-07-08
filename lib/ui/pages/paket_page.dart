import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/paket_item.dart';

class PaketPage extends StatelessWidget {
  const PaketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket'),
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
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: lightGreenColor,
            ),
            child: Column(
              children: [
                PaketItem(
                  namaPaket: 'Lite',
                  kecepatan: '25 Down & 10 Mbps Up',
                  harga: 'Rp.249.000,-/BULAN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-paket');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PaketItem(
                  namaPaket: 'Smart',
                  kecepatan: '50 Down & 20 Mbps Up',
                  harga: 'Rp.369.000,-/BULAN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-paket');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PaketItem(
                  namaPaket: 'HAPPY',
                  kecepatan: '100 Down & 30 Mbps Up',
                  harga: 'Rp.499.000,-/BULAN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-paket');
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

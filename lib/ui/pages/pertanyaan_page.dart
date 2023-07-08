import 'package:flutter/material.dart';
import 'package:permanahome/ui/widgets/pertanyaan_item.dart';

class PertanyaanPage extends StatelessWidget {
  const PertanyaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pertanyaan'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          PertanyaanItem(
            title: 'Pertanyaan ini sering ditanyakan',
            onPressed: () {
              Navigator.pushNamed(context, '/detail-pertanyaan');
            },
          ),
          const SizedBox(
            height: 10,
          ),
          PertanyaanItem(
            title:
                'Pertanyaan ini sering ditanyakan oleh pelanggan Permana Home',
            onPressed: () {
              Navigator.pushNamed(context, '/detail-pertanyaan');
            },
          ),
        ],
      ),
    );
  }
}

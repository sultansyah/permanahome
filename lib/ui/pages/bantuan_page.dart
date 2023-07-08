import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:permanahome/ui/widgets/bantuan_item.dart';

class BantuanPage extends StatelessWidget {
  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              BantuanItem(
                title: 'Daftar pertanyaan yang sering terjadi dengan pelanggan',
                textButton: 'Lihat Pertanyaan',
                gambar: 'assets/ic_pertanyaan.png',
                onPressed: () {
                  Navigator.pushNamed(context, '/pertanyaan');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BantuanItem(
                title: 'Laporkan masalah yang terjadi pada anda',
                textButton: 'Laporkan',
                gambar: 'assets/ic_laporan.png',
                onPressed: () {
                  Navigator.pushNamed(context, '/laporkan');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              BantuanItem(
                title: 'Kunjungi kantor Permana Net',
                textButton: 'Lokasi',
                gambar: 'assets/ic_lokasi.png',
                onPressed: () {
                  MapsLauncher.launchCoordinates(
                    1.1322819675697122,
                    104.0441998048223,
                    'PT. Medianusa Permana',
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'package:permanahome/models/paket_layanan_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/daftar_langganan_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class DetailPaketPage extends StatelessWidget {
  final PaketLayanan paketLayanan;

  const DetailPaketPage({
    super.key,
    required this.paketLayanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Paket ${paketLayanan.nama}"),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(24),
            width: double.infinity,
            height: 682,
            decoration: BoxDecoration(
              color: lightGreyColor,
              border: Border.all(
                width: 1,
                color: lightGreenColor,
              ),
            ),
            child: Column(
              children: [
                Container(
                  color: lightGreenColor,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 50,
                  ),
                  child: Column(
                    children: [
                      Text(
                        paketLayanan.nama ?? '',
                        style: whiteTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Rp.${paketLayanan.biaya ?? ''},-/BULAN',
                        style: whiteTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: paketLayanan.deskripsi
                          ?.split(', ')
                          .mapIndexed((index, element) => buildText(
                              element,
                              (index % 2 == 0)
                                  ? darkGreyColor
                                  : lightGreyColor))
                          .toList() ??
                      [],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'BERLANGGANAN',
                  isRounded: false,
                  width: 190,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DaftarLanggananPage(
                          paketLayanan: paketLayanan,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      color: color,
      width: double.infinity,
      height: 50,
      child: Text(
        text,
        style: blackTextStyle.copyWith(
          fontSize: 14,
          fontWeight: medium,
        ),
      ),
    );
  }
}

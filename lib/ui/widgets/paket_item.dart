import 'package:flutter/material.dart';
import 'package:permanahome/models/paket_layanan_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/detail_paket_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class PaketItem extends StatelessWidget {
  final PaketLayanan paketLayanan;
  final String namaPaket;
  final String kecepatan;

  const PaketItem({
    super.key,
    required this.namaPaket,
    required this.kecepatan,
    required this.paketLayanan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: lightGreyColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                namaPaket,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: lightGreenColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  kecepatan,
                  style: whiteTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Rp.${paketLayanan.biaya!},-/BULAN',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CustomFilledButton(
            title: 'Detail',
            height: 40,
            width: 150,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPaketPage(
                    paketLayanan: paketLayanan,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

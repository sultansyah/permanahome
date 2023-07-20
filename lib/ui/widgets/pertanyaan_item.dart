import 'package:flutter/material.dart';
import 'package:permanahome/models/pertanyaan_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/detail_pertanyaan_page.dart';

class PertanyaanItem extends StatelessWidget {
  final Pertanyaan pertanyaan;

  const PertanyaanItem({
    super.key,
    required this.pertanyaan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPertanyaan(pertanyaan: pertanyaan),
            ),
          );
        },
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                pertanyaan.judul ?? '',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: greenColor,
            ),
          ],
        ),
      ),
    );
  }
}

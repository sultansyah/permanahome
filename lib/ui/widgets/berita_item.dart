import 'package:flutter/material.dart';
import 'package:permanahome/models/berita_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/berita_page.dart';

class BeritaItem extends StatelessWidget {
  final BeritaModel berita;

  const BeritaItem({
    super.key,
    required this.berita,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeritaPage(
              berita: berita,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 155,
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              berita.gambar ?? '',
              width: 155,
              height: 110,
              fit: BoxFit.cover,
            ),
            Text(
              berita.judul ?? '',
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}

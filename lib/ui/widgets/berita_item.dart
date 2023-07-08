import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/berita_page.dart';

class BeritaItem extends StatelessWidget {
  final String title;
  final String konten;
  final String gambar;
  final String tanggal;
  final VoidCallback? onPressed;

  const BeritaItem({
    super.key,
    required this.title,
    required this.konten,
    required this.tanggal,
    required this.gambar,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BeritaPage(
              title: title,
              konten: konten,
              tanggal: tanggal,
              gambar: gambar,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        width: 155,
        height: 176,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/img_berita1.png'),
            Text(
              title,
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

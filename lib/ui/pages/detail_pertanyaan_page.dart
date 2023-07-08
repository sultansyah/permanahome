import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class DetailPertanyaan extends StatelessWidget {
  // final String title;
  // final String konten;
  // final String tanggal;
  final String? gambar;

  const DetailPertanyaan({
    super.key,
    // required this.title,
    // required this.konten,
    // required this.tanggal,
    this.gambar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertanyaan'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 2,
                ),
                child: Image.asset(
                  'assets/ic_kalender.png',
                  width: 15,
                ),
              ),
              Text(
                '23 Juni 2023',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
            color: whiteColor,
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                if (gambar != null)
                  Image.asset(
                    gambar!,
                    width: 313,
                  ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam phasellus vestibulum lorem sed risus. Diam maecenas ultricies mi eget. Nam at lectus urna duis convallis. Malesuada proin libero nunc consequat. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Ut lectus arcu bibendum at. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Vitae congue mauris rhoncus aenean vel elit scelerisque. Ultricies lacus sed turpis tincidunt id aliquet. Nullam ac tortor vitae purus faucibus ornare. Lorem ipsum dolor sit amet consectetur. Consectetur adipiscing elit ut aliquam purus sit amet. Purus ut faucibus pulvinar elementum integer. Nulla at volutpat diam ut venenatis tellus in metus. Id leo in vitae turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Enim blandit volutpat maecenas volutpat blandit. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Magna etiam tempor orci eu lobortis elementum. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Mattis molestie a iaculis at erat. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Pellentesque massa placerat duis ultricies lacus sed. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Nulla malesuada pellentesque elit eget gravida cum sociis. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Ut diam quam nulla porttitor massa id. Magna etiam tempor orci eu. At elementum eu facilisis sed odio morbi. Neque vitae tempus quam pellentesque. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam phasellus vestibulum lorem sed risus. Diam maecenas ultricies mi eget. Nam at lectus urna duis convallis. Malesuada proin libero nunc consequat. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Ut lectus arcu bibendum at. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Vitae congue mauris rhoncus aenean vel elit scelerisque. Ultricies lacus sed turpis tincidunt id aliquet. Nullam ac tortor vitae purus faucibus ornare. Lorem ipsum dolor sit amet consectetur. Consectetur adipiscing elit ut aliquam purus sit amet. Purus ut faucibus pulvinar elementum integer. Nulla at volutpat diam ut venenatis tellus in metus. Id leo in vitae turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Enim blandit volutpat maecenas volutpat blandit. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Magna etiam tempor orci eu lobortis elementum. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Mattis molestie a iaculis at erat. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Pellentesque massa placerat duis ultricies lacus sed. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Nulla malesuada pellentesque elit eget gravida cum sociis. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Ut diam quam nulla porttitor massa id. Magna etiam tempor orci eu. At elementum eu facilisis sed odio morbi. Neque vitae tempus quam pellentesque. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt.',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/set_page.dart';
import 'package:permanahome/ui/widgets/berita_item.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/penawaran_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  right: 18,
                  left: 18,
                  bottom: 20,
                ),
                color: lightGreenColor,
                child: Column(
                  children: [
                    buildProfile(context),
                    const SizedBox(
                      height: 5,
                    ),
                    // buildTwoCard(context),
                    buildOneCard(context),
                  ],
                ),
              ),
              // tambah penawaran terbaru disini
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    buildPenawaranTerbaru(context),
                    const SizedBox(
                      height: 17,
                    ),
                    buildBerita(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Muhammad Sultansyah',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SetPage(
                  index: 4,
                ),
              ),
            );
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/img_profile.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildOneCard(BuildContext context) {
    return Container(
      width: 327,
      height: 239,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: lightBackgroundColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/permana-home-number');
            },
            child: Row(
              children: [
                Text(
                  'Permana Home Number',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ),
          Text(
            'number',
            style: lightGreenTextStyle.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Paket yang sedang aktif',
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'nama paket',
            style: lightGreenTextStyle.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'Total Tagihan',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: semiBold,
                ),
              ),
              const Spacer(),
              Container(
                width: 110,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greenColor,
                ),
                child: Text(
                  'Sudah dibayar',
                  textAlign: TextAlign.center,
                  style: darkGreenTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'total',
            style: blackTextStyle.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 37,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: lightGreyColor,
            child: Row(
              children: [
                Text(
                  'Tagihan Berikutnya',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
                const Spacer(),
                Text(
                  '28 Juni 2023',
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 13,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallCard(
    BuildContext context,
    String title,
    String subtitle,
    String textButton,
    VoidCallback? onPressed,
  ) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
        right: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: lightBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            subtitle,
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomFilledButton(
            title: textButton,
            width: 150,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  Widget buildTwoCard(BuildContext context) {
    return Row(
      children: [
        buildSmallCard(
          context,
          'Pilih Paketmu\nSekarang Juga',
          'tanpa batasan kuota\nmulai dari\nRp.249.000,-/BULAN',
          'Cari Paket',
          () {
            Navigator.pushNamed(context, '/paket');
          },
        ),
        const SizedBox(
          width: 10,
        ),
        buildSmallCard(
          context,
          'Sudah Langganan\nPermana Home?',
          'Hubungkan permana\nhome number anda\ndengan akun aplikasi\nPermanaHome ini',
          'Hubungkan',
          () {
            Navigator.pushNamed(context, '/permana-home-number');
          },
        ),
      ],
    );
  }

  Widget buildPenawaranTerbaru(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Penawaran Terbaru',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PenawaranItem(
                title: 'Ayo Upgrade Sekararang Juga Semuanya',
                gambar: 'assets/img_penawaran1.png',
                onPressed: () {
                  Navigator.pushNamed(context, '/upgrade-paket');
                },
              ),
              const SizedBox(
                width: 14,
              ),
              PenawaranItem(
                title: 'Ayo Upgrade Sekararang Juga Semuanya',
                gambar: 'assets/img_penawaran1.png',
                onPressed: () {
                  Navigator.pushNamed(context, '/upgrade-paket');
                },
              ),
              const SizedBox(
                width: 14,
              ),
              PenawaranItem(
                title: 'Ayo Upgrade Sekararang Juga Semuanya',
                gambar: 'assets/img_penawaran1.png',
                onPressed: () {
                  Navigator.pushNamed(context, '/upgrade-paket');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBerita() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Berita',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              BeritaItem(
                title: 'Tingkatkan Tri Dharma Perguruan Tinggi',
                tanggal: '12 Juni 2023',
                konten:
                    'Tingkatkan Tri Dharma Perguruan Tinggi Tingkatkan Tri Dharma Perguruan Tinggi Tingkatkan Tri Dharma Perguruan Tinggi Tingkatkan Tri Dharma Perguruan Tinggi Tingkatkan Tri Dharma Perguruan Tinggi',
                gambar: 'assets/img_berita2.png',
              ),
              SizedBox(
                width: 14,
              ),
              BeritaItem(
                title:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                tanggal: '12 Juni 2023',
                konten:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam phasellus vestibulum lorem sed risus. Diam maecenas ultricies mi eget. Nam at lectus urna duis convallis. Malesuada proin libero nunc consequat. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Ut lectus arcu bibendum at. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Vitae congue mauris rhoncus aenean vel elit scelerisque. Ultricies lacus sed turpis tincidunt id aliquet. Nullam ac tortor vitae purus faucibus ornare. Lorem ipsum dolor sit amet consectetur. Consectetur adipiscing elit ut aliquam purus sit amet. Purus ut faucibus pulvinar elementum integer. Nulla at volutpat diam ut venenatis tellus in metus. Id leo in vitae turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Enim blandit volutpat maecenas volutpat blandit. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Magna etiam tempor orci eu lobortis elementum. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Mattis molestie a iaculis at erat. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Pellentesque massa placerat duis ultricies lacus sed. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Nulla malesuada pellentesque elit eget gravida cum sociis. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Ut diam quam nulla porttitor massa id. Magna etiam tempor orci eu. At elementum eu facilisis sed odio morbi. Neque vitae tempus quam pellentesque. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam phasellus vestibulum lorem sed risus. Diam maecenas ultricies mi eget. Nam at lectus urna duis convallis. Malesuada proin libero nunc consequat. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Ut lectus arcu bibendum at. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Vitae congue mauris rhoncus aenean vel elit scelerisque. Ultricies lacus sed turpis tincidunt id aliquet. Nullam ac tortor vitae purus faucibus ornare. Lorem ipsum dolor sit amet consectetur. Consectetur adipiscing elit ut aliquam purus sit amet. Purus ut faucibus pulvinar elementum integer. Nulla at volutpat diam ut venenatis tellus in metus. Id leo in vitae turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Enim blandit volutpat maecenas volutpat blandit. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Magna etiam tempor orci eu lobortis elementum. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Mattis molestie a iaculis at erat. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Pellentesque massa placerat duis ultricies lacus sed. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Nulla malesuada pellentesque elit eget gravida cum sociis. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Ut diam quam nulla porttitor massa id. Magna etiam tempor orci eu. At elementum eu facilisis sed odio morbi. Neque vitae tempus quam pellentesque. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt.',
                gambar: 'assets/img_berita2.png',
              ),
              SizedBox(
                width: 14,
              ),
              BeritaItem(
                title:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                tanggal: '12 Juni 2023',
                konten:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam phasellus vestibulum lorem sed risus. Diam maecenas ultricies mi eget. Nam at lectus urna duis convallis. Malesuada proin libero nunc consequat. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Ut lectus arcu bibendum at. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Vitae congue mauris rhoncus aenean vel elit scelerisque. Ultricies lacus sed turpis tincidunt id aliquet. Nullam ac tortor vitae purus faucibus ornare. Lorem ipsum dolor sit amet consectetur. Consectetur adipiscing elit ut aliquam purus sit amet. Purus ut faucibus pulvinar elementum integer. Nulla at volutpat diam ut venenatis tellus in metus. Id leo in vitae turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Enim blandit volutpat maecenas volutpat blandit. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Magna etiam tempor orci eu lobortis elementum. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Mattis molestie a iaculis at erat. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Pellentesque massa placerat duis ultricies lacus sed. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Nulla malesuada pellentesque elit eget gravida cum sociis. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Ut diam quam nulla porttitor massa id. Magna etiam tempor orci eu. At elementum eu facilisis sed odio morbi. Neque vitae tempus quam pellentesque. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Diam phasellus vestibulum lorem sed risus. Diam maecenas ultricies mi eget. Nam at lectus urna duis convallis. Malesuada proin libero nunc consequat. Auctor neque vitae tempus quam pellentesque nec nam aliquam sem. Ut lectus arcu bibendum at. Vitae proin sagittis nisl rhoncus mattis rhoncus urna. Vitae congue mauris rhoncus aenean vel elit scelerisque. Ultricies lacus sed turpis tincidunt id aliquet. Nullam ac tortor vitae purus faucibus ornare. Lorem ipsum dolor sit amet consectetur. Consectetur adipiscing elit ut aliquam purus sit amet. Purus ut faucibus pulvinar elementum integer. Nulla at volutpat diam ut venenatis tellus in metus. Id leo in vitae turpis massa sed elementum tempus. Nam aliquam sem et tortor consequat id porta. Enim blandit volutpat maecenas volutpat blandit. Neque vitae tempus quam pellentesque nec nam aliquam sem et. Magna etiam tempor orci eu lobortis elementum. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Mattis molestie a iaculis at erat. Diam sollicitudin tempor id eu nisl nunc mi ipsum. Aliquet eget sit amet tellus cras adipiscing enim eu turpis. Pellentesque massa placerat duis ultricies lacus sed. Odio ut enim blandit volutpat maecenas volutpat blandit aliquam. Nulla malesuada pellentesque elit eget gravida cum sociis. Lectus vestibulum mattis ullamcorper velit sed ullamcorper. Ut diam quam nulla porttitor massa id. Magna etiam tempor orci eu. At elementum eu facilisis sed odio morbi. Neque vitae tempus quam pellentesque. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend donec. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt.',
                gambar: 'assets/img_berita2.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

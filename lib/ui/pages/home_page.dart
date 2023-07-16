import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/models/user_permana_home_number_model.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/auth/auth_bloc.dart';
import 'package:permanahome/ui/blocs/berita/berita_bloc.dart';
import 'package:permanahome/ui/blocs/user_permana_home_number/user_permana_home_number_bloc.dart';
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
                child: BlocConsumer<UserPermanaHomeNumberBloc,
                    UserPermanaHomeNumberState>(
                  listener: (context, state) {
                    if (state is UserPermanaHomeNumberFailed) {
                      showCustomSnackbar(context, state.e);
                    }
                  },
                  builder: (context, state) {
                    if (state is UserPermanaHomeNumberSuccess) {
                      return Column(
                        children: [
                          buildProfile(context),
                          const SizedBox(
                            height: 5,
                          ),
                          buildOneCard(
                            context,
                            state.userPermanaHomeNumbers
                                .firstWhere((element) => element.isActive == 1),
                          ),
                        ],
                      );
                    }

                    return Column(
                      children: [
                        buildProfile(context),
                        const SizedBox(
                          height: 5,
                        ),
                        buildTwoCard(context),
                      ],
                    );
                  },
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
                    const SizedBox(
                      height: 17,
                    ),
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.user.fullName ?? '',
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: (state.user.profilePicture == null)
                        ? const DecorationImage(
                            image: AssetImage('assets/img_profile.png'),
                          )
                        : DecorationImage(
                            image: NetworkImage(state.user.profilePicture!),
                          ),
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  Widget buildOneCard(BuildContext context, UserPermanaHomeNumber data) {
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
            data.permanaHomeNumberId.toString(),
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
            data.permanaHomeNumber!.paketLayanan!.nama.toString(),
            style: lightGreenTextStyle.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
              letterSpacing: 2,
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
        const SizedBox(
          height: 14,
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
        const SizedBox(
          height: 14,
        ),
        BlocProvider(
          create: (context) => BeritaBloc()..add(BeritaGet()),
          child: BlocBuilder<BeritaBloc, BeritaState>(
            builder: (context, state) {
              if (state is BeritaSuccess) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.berita
                        .map(
                          (e) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: BeritaItem(berita: e),
                          ),
                        )
                        .toList(),
                  ),
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}

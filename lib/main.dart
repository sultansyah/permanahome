import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'shared/theme.dart';
import 'ui/blocs/auth/auth_bloc.dart';
import 'ui/blocs/berita/berita_bloc.dart';
import 'ui/blocs/user_permana_home_number/user_permana_home_number_bloc.dart';
import 'ui/pages/detail_notifikasi_page.dart';
import 'ui/pages/detail_paket_page.dart';
import 'ui/pages/detail_pertanyaan_page.dart';
import 'ui/pages/detail_riwayat_page.dart';
import 'ui/pages/detail_upgrade_paket_page.dart';
import 'ui/pages/edit_profile_page.dart';
import 'ui/pages/hubungkan_permana_home_number_page.dart';
import 'ui/pages/laporkan_page.dart';
import 'ui/pages/masukan_page.dart';
import 'ui/pages/onboarding_page.dart';
import 'ui/pages/paket_page.dart';
import 'ui/pages/permana_home_number_page.dart';
import 'ui/pages/pertanyaan_page.dart';
import 'ui/pages/profile_page.dart';
import 'ui/pages/riwayat_page.dart';
import 'ui/pages/set_page.dart';
import 'ui/pages/sign_in_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/splash_page.dart';
import 'ui/pages/tentang_page.dart';
import 'ui/pages/upgrade_paket_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) =>
              UserPermanaHomeNumberBloc()..add(UserPermanaHomeNumberGet()),
        ),
        BlocProvider(
          create: (context) => BeritaBloc()..add(BeritaGet()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor,
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const SetPage(),
          '/profile': (context) => const ProfilePage(),
          '/paket': (context) => const PaketPage(),
          '/detail-paket': (context) => const DetailPaketPage(),
          '/detail-upgrade-paket': (context) => const DetailUpgradePaketPage(),
          '/upgrade-paket': (context) => const UpgradePaketPage(),
          '/permana-home-number': (context) => const PermanaHomeNumberPage(),
          '/hubungkan-permana-home-number': (context) =>
              const HubungkanPermanaHomeNumberPage(),
          '/riwayat': (context) => const RiwayatPage(),
          '/detail-riwayat': (context) => const DetailRiwayatPage(),
          '/detail-notifikasi': (context) => const DetailNotifikasiPage(),
          '/pertanyaan': (context) => const PertanyaanPage(),
          '/detail-pertanyaan': (context) => const DetailPertanyaan(),
          '/laporkan': (context) => const LaporkanPage(),
          '/masukan': (context) => const MasukanPage(),
          '/tentang': (context) => const TentangPage(),
          '/edit-profile': (context) => const EditProfilePage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/bantuan_page.dart';
import 'package:permanahome/ui/pages/home_page.dart';
import 'package:permanahome/ui/pages/notifikasi_page.dart';
import 'package:permanahome/ui/pages/profile_page.dart';
import 'package:permanahome/ui/pages/riwayat_page.dart';

class SetPage extends StatefulWidget {
  final int? index;

  const SetPage({
    super.key,
    this.index,
  });

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  int index = 0;

  @override
  void initState() {
    super.initState();

    index = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: lightGreenColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: lightGreenTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          currentIndex: index,
          onTap: (int index) {
            setState(() {
              this.index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_home.png',
                width: 20,
                color: blackColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_riwayat.png',
                width: 20,
                color: blackColor,
              ),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_notifikasi.png',
                width: 20,
                color: blackColor,
              ),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_bantuan.png',
                width: 20,
                color: blackColor,
              ),
              label: 'Bantuan',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_profile.png',
                width: 20,
                color: blackColor,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: index,
        children: const [
          HomePage(),
          RiwayatPage(),
          NotifikasiPage(),
          BantuanPage(),
          ProfilePage(),
        ],
      ),
    );
  }
}

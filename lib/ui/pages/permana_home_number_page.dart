import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/permana_home_number_item.dart';

class PermanaHomeNumberPage extends StatelessWidget {
  const PermanaHomeNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permana Home Number'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: lightGreenColor,
            ),
            child: Column(
              children: [
                PermanaHomeNumberItem(
                  permanaHomeNumber: '121721721',
                  isAktif: true,
                  onPressedGanti: () {},
                  onPressedHapus: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                PermanaHomeNumberItem(
                  permanaHomeNumber: '121721721',
                  isAktif: false,
                  onPressedGanti: () {},
                  onPressedHapus: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                PermanaHomeNumberItem(
                  permanaHomeNumber: '121721721',
                  isAktif: false,
                  onPressedGanti: () {},
                  onPressedHapus: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Hubungkan',
          onPressed: () {
            Navigator.pushNamed(context, '/hubungkan-permana-home-number');
          },
        ),
      ),
    );
  }
}

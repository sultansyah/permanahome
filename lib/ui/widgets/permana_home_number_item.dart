import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class PermanaHomeNumberItem extends StatelessWidget {
  final String permanaHomeNumber;
  final bool isAktif;
  final VoidCallback? onPressedHapus;
  final VoidCallback? onPressedGanti;

  const PermanaHomeNumberItem({
    super.key,
    required this.permanaHomeNumber,
    required this.isAktif,
    this.onPressedHapus,
    this.onPressedGanti,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: lightGreyColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isAktif)
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Aktif',
                style: lightGreenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
            ),
          Text(
            permanaHomeNumber,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomFilledButton(
                title: 'Hapus',
                height: 40,
                width: 120,
                onPressed: onPressedHapus,
              ),
              CustomFilledButton(
                title: 'Ganti',
                height: 40,
                width: 120,
                onPressed: onPressedGanti,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

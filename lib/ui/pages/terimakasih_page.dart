import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class TerimakasihPage extends StatelessWidget {
  final String ucapan;
  final VoidCallback onPressed;

  const TerimakasihPage({
    super.key,
    required this.ucapan,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ucapan,
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: extraBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 26,
              ),
              CustomFilledButton(
                title: 'Kembali',
                width: 150,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

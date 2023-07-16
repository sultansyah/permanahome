import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/terimakasih_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class DetailUpgradePaketPage extends StatefulWidget {
  const DetailUpgradePaketPage({super.key});

  @override
  State<DetailUpgradePaketPage> createState() => _DetailUpgradePaketPageState();
}

class _DetailUpgradePaketPageState extends State<DetailUpgradePaketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Paket"),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(24),
            width: double.infinity,
            height: 682,
            decoration: BoxDecoration(
              color: lightGreyColor,
              border: Border.all(
                width: 1,
                color: lightGreenColor,
              ),
            ),
            child: Column(
              children: [
                Container(
                  color: lightGreenColor,
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 50,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'LITE',
                        style: whiteTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Rp.249.000,-/BULAN',
                        style: whiteTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                buildText('Up To 25 Mbps Download', darkGreyColor),
                buildText('Up To 10 Mbps Upload', lightGreyColor),
                buildText('Kontrak Minimal 12 Bulan', darkGreyColor),
                buildText('Private IP Address', lightGreyColor),
                buildText('Unlimited Data', darkGreyColor),
                buildText('SLA : Best Effort', lightGreyColor),
                buildText('Tanpa FUP', darkGreyColor),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'UPGRADE',
                  isRounded: false,
                  width: 190,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TerimakasihPage(
                          ucapan:
                              'Terimakasih Sudah Berlangganan Kami akan memberitahukan kepada anda secepatnya',
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      color: color,
      width: double.infinity,
      height: 50,
      child: Text(
        text,
        style: blackTextStyle.copyWith(
          fontSize: 14,
          fontWeight: medium,
        ),
      ),
    );
  }
}

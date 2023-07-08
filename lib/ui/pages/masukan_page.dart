import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/set_page.dart';
import 'package:permanahome/ui/pages/terimakasih_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/forms.dart';

class MasukanPage extends StatefulWidget {
  const MasukanPage({super.key});

  @override
  State<MasukanPage> createState() => _MasukanPageState();
}

class _MasukanPageState extends State<MasukanPage> {
  final masukanController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kirim Masukan'),
      ),
      body: Container(
        width: double.infinity,
        height: 300,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,
        ),
        child: Column(
          children: [
            CustomFormField(
              title: 'Masukan',
              maxLines: 8,
              controller: masukanController,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomFilledButton(
              title: 'Kirim',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TerimakasihPage(
                      ucapan:
                          'Terima kasih sudah memberi Masukan terhadap Aplikasi ini.',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SetPage(
                              index: 4,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

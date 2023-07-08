import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/daftar_langganan_set_ktp_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/forms.dart';

class DaftarLanggananPage extends StatefulWidget {
  final String namaPaket;

  const DaftarLanggananPage({
    super.key,
    required this.namaPaket,
  });

  @override
  State<DaftarLanggananPage> createState() => _DaftarLanggananPageState();
}

class _DaftarLanggananPageState extends State<DaftarLanggananPage> {
  final namaLengkapController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final alamatInstalasiController = TextEditingController(text: '');
  final kotaController = TextEditingController(text: '');
  final provinsiController = TextEditingController(text: '');
  final noHpController = TextEditingController(text: '');
  final noWaController = TextEditingController(text: '');
  final kodePosController = TextEditingController(text: '');

  bool validate() {
    if (namaLengkapController.text.isEmpty ||
        emailController.text.isEmpty ||
        kotaController.text.isEmpty ||
        provinsiController.text.isEmpty ||
        noHpController.text.isEmpty ||
        noWaController.text.isEmpty ||
        kodePosController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 100,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo.png'),
              ),
            ),
          ),
          Text(
            'Saatnya #SamaPermana\ndan #ManjakanHarimu',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paket: ${widget.namaPaket}',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomFormField(
                  title: 'Nama Lengkap',
                  controller: namaLengkapController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Email',
                  controller: emailController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Alamat Instalasi',
                  controller: alamatInstalasiController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Kota',
                  controller: kotaController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Provinsi',
                  controller: provinsiController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'No Hp',
                  controller: noHpController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'No Wa',
                  controller: noWaController,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  title: 'Kode Pos',
                  controller: kodePosController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Selanjutnya',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DaftarLanggananSetKTPPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

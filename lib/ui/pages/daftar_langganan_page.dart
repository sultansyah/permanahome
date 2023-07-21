import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/models/formulir_instalasi_model.dart';
import 'package:permanahome/models/paket_layanan_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/auth/auth_bloc.dart';
import 'package:permanahome/ui/pages/daftar_langganan_set_ktp_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/forms.dart';

class DaftarLanggananPage extends StatefulWidget {
  final PaketLayanan paketLayanan;

  const DaftarLanggananPage({
    super.key,
    required this.paketLayanan,
  });

  @override
  State<DaftarLanggananPage> createState() => _DaftarLanggananPageState();
}

class _DaftarLanggananPageState extends State<DaftarLanggananPage> {
  final namaLengkapController = TextEditingController(text: 'fathanfathan');
  final emailController = TextEditingController(text: 'fathanfathan@gmail.com');
  final alamatInstalasiController =
      TextEditingController(text: 'Jalan Sana Sini');
  final negaraController = TextEditingController(text: 'Indonesia');
  final provinsiController = TextEditingController(text: 'Kepulauan Riau');
  final kotaController = TextEditingController(text: 'Batam');
  final noHpController = TextEditingController(text: '21921921829');
  final noWaController = TextEditingController(text: '21921921829');
  final kodePosController = TextEditingController(text: '219219');

  bool validate() {
    if (namaLengkapController.text.isEmpty ||
        emailController.text.isEmpty ||
        provinsiController.text.isEmpty ||
        negaraController.text.isEmpty ||
        kotaController.text.isEmpty ||
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
      appBar: AppBar(automaticallyImplyLeading: true),
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is AuthSuccess &&
            state.user.fullName != null &&
            state.user.email != null &&
            state.user.username != null &&
            state.user.password != null &&
            state.user.noHp != null &&
            state.user.noWa != null) {
          namaLengkapController.text = state.user.fullName!;
          emailController.text = state.user.email!;
          noHpController.text = state.user.noHp!;
          noWaController.text = state.user.noWa!;
        }

        return ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            Container(
              width: 155,
              height: 50,
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 20,
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
                    'Paket: ${widget.paketLayanan.nama}',
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
                    title: 'Negara',
                    controller: negaraController,
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
                    title: 'Kota',
                    controller: kotaController,
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
                          builder: (context) => DaftarLanggananSetKTPPage(
                            formulirInstalasi: FormulirInstalasi(
                              fullName: namaLengkapController.text,
                              email: emailController.text,
                              noHp: noHpController.text,
                              noWa: noWaController.text,
                              negara: negaraController.text,
                              provinsi: provinsiController.text,
                              kota: kotaController.text,
                              alamatInstalasi: alamatInstalasiController.text,
                              kodePos: kodePosController.text,
                              paketLayananId: widget.paketLayanan.id,
                            ),
                          ),
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
        );
      }),
    );
  }
}

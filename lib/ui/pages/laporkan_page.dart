import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/models/pengaduan_model.dart';
import 'package:permanahome/shared/shared_values.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/pengaduan/pengaduan_bloc.dart';
import 'package:permanahome/ui/pages/set_page.dart';
import 'package:permanahome/ui/pages/terimakasih_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/forms.dart';

class LaporkanPage extends StatefulWidget {
  const LaporkanPage({super.key});

  @override
  State<LaporkanPage> createState() => _LaporkanPageState();
}

class _LaporkanPageState extends State<LaporkanPage> {
  final deskripsiController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelaporan Masalah'),
      ),
      body: BlocProvider<PengaduanBloc>(
        create: (context) => PengaduanBloc(),
        child: BlocConsumer<PengaduanBloc, PengaduanState>(
          listener: (context, state) {
            if (state is PengaduanFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is PengaduanSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => TerimakasihPage(
                    ucapan:
                        'Proses Pelaporan Masalah Berhasil. Tim kami akan secepatnya menghubungi anda. Terima kasih.',
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetPage(
                            index: 3,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is PengaduanFailed) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
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
                    title: 'Deskripsi',
                    maxLines: 8,
                    controller: deskripsiController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomFilledButton(
                    title: 'Kirim',
                    onPressed: () {
                      context.read<PengaduanBloc>().add(
                            PengaduanEventAdd(
                              Pengaduan(
                                  deskripsi: deskripsiController.text,
                                  jenis: 'Lambat Jaringan',
                                  userId: (globalUser != null)
                                      ? globalUser!.id.toString()
                                      : null,
                                  permanaHomeNumberId:
                                      (globalPermanaHomeNumberId != null)
                                          ? globalPermanaHomeNumberId.toString()
                                          : null),
                            ),
                          );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

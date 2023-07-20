import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/models/masukan_model.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/masukan/masukan_bloc.dart';
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
      body: BlocProvider(
        create: (context) => MasukanBloc(),
        child: BlocConsumer<MasukanBloc, MasukanState>(
          listener: (context, state) {
            if (state is MasukanFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is MasukanSuccess) {
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
            }
          },
          builder: (context, state) {
            if (state is MasukanLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 10,
              ),
              margin: const EdgeInsets.only(
                right: 24,
                left: 24,
                top: 5,
                bottom: 30,
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
                      context.read<MasukanBloc>().add(
                            MasukanEventAdd(
                              Masukan(deskripsi: masukanController.text),
                            ),
                          );
                    },
                  ),
                  const SizedBox(
                    height: 25,
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

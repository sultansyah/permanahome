import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/models/paket_layanan_model.dart';
import 'package:permanahome/models/permintaan_model.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/permintaan/permintaan_bloc.dart';
import 'package:permanahome/ui/pages/terimakasih_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class DetailUpgradePaketPage extends StatefulWidget {
  final String permanaHomeNumberId;
  final PaketLayanan paketLayanan;

  const DetailUpgradePaketPage(
      {super.key,
      required this.paketLayanan,
      required this.permanaHomeNumberId});

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
      body: BlocProvider(
        create: (context) => PermintaanBloc(),
        child: BlocConsumer<PermintaanBloc, PermintaanState>(
          listener: (context, state) {
            if (state is PermintaanFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is PermintaanSuccess) {
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
            }
          },
          builder: (context, state) {
            if (state is PermintaanLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
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
                              widget.paketLayanan.nama ?? '',
                              style: whiteTextStyle.copyWith(
                                fontSize: 30,
                                fontWeight: semiBold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Rp.${widget.paketLayanan.biaya ?? ''},-/BULAN',
                              style: whiteTextStyle.copyWith(
                                fontSize: 30,
                                fontWeight: semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: widget.paketLayanan.deskripsi
                                ?.split(', ')
                                .mapIndexed((index, element) => buildText(
                                    element,
                                    (index % 2 == 0)
                                        ? darkGreyColor
                                        : lightGreyColor))
                                .toList() ??
                            [],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFilledButton(
                        title: 'UPGRADE',
                        isRounded: false,
                        width: 190,
                        onPressed: () {
                          context.read<PermintaanBloc>().add(
                                PermintaanEventAdd(
                                  Permintaan(
                                    jenis: 'Upgrade Layanan',
                                    deskripsi:
                                        "Upgrade jaringan ke ${widget.paketLayanan.nama}",
                                    permanaHomeNumberId:
                                        widget.permanaHomeNumberId,
                                    // permanaHomeNumberId:
                                  ),
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
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

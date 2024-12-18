import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/shared/shared_values.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/paket_layanan/paket_layanan_bloc.dart';
import 'package:permanahome/ui/pages/detail_upgrade_paket_page.dart';
import 'package:permanahome/ui/widgets/paket_item.dart';

class UpgradePaketPage extends StatelessWidget {
  final String permanaHomeNumberId;
  const UpgradePaketPage({
    super.key,
    required this.permanaHomeNumberId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade Speed'),
      ),
      body: BlocProvider(
        create: (context) => PaketLayananBloc()..add(PaketLayananGet(area)),
        child: BlocConsumer<PaketLayananBloc, PaketLayananState>(
          listener: (context, state) {
            if (state is PaketLayananFailed) {
              showCustomSnackbar(context, state.e);
            }
          },
          builder: (context, state) {
            if (state is PaketLayananSuccess) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Perlu Koneksi yang Lebih Cepat? Tingkatkan Sekarang Layanan Anda',
                          style: blackTextStyle.copyWith(
                            fontSize: 15,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          'Tingkatkan koneksi Anda untuk kecepatan yang lebih tinggi dengan segera mengupgrade paket layanan Anda. Nikmati pengalaman online yang lebih lancar dan akses konten dengan lebih cepat. Jangan lewatkan kesempatan untuk memperbaiki koneksi internet Anda dengan melakukan upgrade paket sekarang.',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 30,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: lightGreenColor,
                            ),
                            child: Column(
                              children: [
                                PaketItem(
                                  namaPaket: 'Lite',
                                  kecepatan: '25 Down & 10 Mbps Up',
                                  paketLayanan: state.paketLayanan[0],
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailUpgradePaketPage(
                                          permanaHomeNumberId:
                                              permanaHomeNumberId,
                                          paketLayanan: state.paketLayanan[0],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                PaketItem(
                                  namaPaket: 'Smart',
                                  kecepatan: '50 Down & 20 Mbps Up',
                                  paketLayanan: state.paketLayanan[1],
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailUpgradePaketPage(
                                          permanaHomeNumberId:
                                              permanaHomeNumberId,
                                          paketLayanan: state.paketLayanan[1],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                PaketItem(
                                  namaPaket: 'HAPPY',
                                  kecepatan: '100 Down & 30 Mbps Up',
                                  paketLayanan: state.paketLayanan[2],
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailUpgradePaketPage(
                                          permanaHomeNumberId:
                                              permanaHomeNumberId,
                                          paketLayanan: state.paketLayanan[2],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

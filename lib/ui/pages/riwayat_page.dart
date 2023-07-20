import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/shared/shared_values.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/riwayat/riwayat_bloc.dart';
import 'package:permanahome/ui/widgets/riwayat_item.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat'),
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider<RiwayatBloc>(
        create: (context) =>
            RiwayatBloc()..add(RiwayatEventGet(globalPermanaHomeNumberId ?? 0)),
        child: BlocConsumer<RiwayatBloc, RiwayatState>(
          listener: (context, state) {
            if (state is RiwayatFailed) {
              showCustomSnackbar(context, state.e);
            }
          },
          builder: (context, state) {
            if (state is RiwayatSuccess) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: state.riwayat.map((e) {
                        return Column(
                          children: [
                            RiwayatItem(riwayat: e),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(),
                          ],
                        );
                      }).toList(),
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

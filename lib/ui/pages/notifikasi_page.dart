import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/notifikasi/notifikasi_bloc.dart';
import 'package:permanahome/ui/widgets/notifikasi_item.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => NotifikasiBloc()
          ..add(
            const NotifikasiEventGet(),
          ),
        child: BlocConsumer<NotifikasiBloc, NotifikasiState>(
          listener: (context, state) {
            if (state is NotifikasiFailed) {
              showCustomSnackbar(context, state.e);
            }
          },
          builder: (context, state) {
            if (state is NotifikasiSuccess) {
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
                      children: state.notifikasi
                          .map(
                            (notif) => NotifikasiItem(notifikasi: notif),
                          )
                          .toList(),
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

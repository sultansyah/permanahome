import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/ui/blocs/pertanyaan/pertanyaan_bloc.dart';
import 'package:permanahome/ui/widgets/pertanyaan_item.dart';

class PertanyaanPage extends StatelessWidget {
  const PertanyaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pertanyaan'),
      ),
      body: BlocProvider<PertanyaanBloc>(
        create: (context) => PertanyaanBloc()..add(PertanyaanEventGet()),
        child: BlocBuilder<PertanyaanBloc, PertanyaanState>(
          builder: (context, state) {
            if (state is PertanyaanSuccess) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                children: state.pertanyaan
                    .map((e) => PertanyaanItem(pertanyaan: e))
                    .toList(),
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

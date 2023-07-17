import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/user_permana_home_number/user_permana_home_number_bloc.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/forms.dart';

class HubungkanPermanaHomeNumberPage extends StatefulWidget {
  const HubungkanPermanaHomeNumberPage({super.key});

  @override
  State<HubungkanPermanaHomeNumberPage> createState() =>
      _HubungkanPermanaHomeNumberPageState();
}

class _HubungkanPermanaHomeNumberPageState
    extends State<HubungkanPermanaHomeNumberPage> {
  final permanaHomeNumberController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    bool validate() {
      return permanaHomeNumberController.text.isNotEmpty;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hubungkan'),
      ),
      body: BlocConsumer<UserPermanaHomeNumberBloc, UserPermanaHomeNumberState>(
        listener: (context, state) {
          if (state is UserPermanaHomeNumberFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is UserPermanaHomeNumberSuccess) {
            showCustomSnackbar(context, 'Berhasil ditambah');
            Timer(const Duration(seconds: 2), () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/permana-home-number',
                (route) => false,
              );
            });
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            height: 180,
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
                  title: 'Permana Home Number',
                  controller: permanaHomeNumberController,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomFilledButton(
                  title: 'Hubungkan',
                  onPressed: () {
                    if (validate()) {
                      context
                          .read<UserPermanaHomeNumberBloc>()
                          .add(UserPermanaHomeNumberAdd(
                            int.parse(permanaHomeNumberController.text),
                          ));
                    } else {
                      showCustomSnackbar(context, 'Semua kolom harus diisi');
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

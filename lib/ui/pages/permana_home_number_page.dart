import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/user_permana_home_number/user_permana_home_number_bloc.dart';

import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/permana_home_number_item.dart';

class PermanaHomeNumberPage extends StatefulWidget {
  const PermanaHomeNumberPage({super.key});

  @override
  State<PermanaHomeNumberPage> createState() => _PermanaHomeNumberPageState();
}

class _PermanaHomeNumberPageState extends State<PermanaHomeNumberPage> {
  @override
  Widget build(BuildContext context) {
    context.read<UserPermanaHomeNumberBloc>().add(UserPermanaHomeNumberGet());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Permana Home Number'),
      ),
      body: BlocConsumer<UserPermanaHomeNumberBloc, UserPermanaHomeNumberState>(
        listener: (context, state) {
          if (state is UserPermanaHomeNumberFailed) {
            showCustomSnackbar(context, state.e);
          }
        },
        builder: (context, state) {
          if (state is UserPermanaHomeNumberSuccess &&
              state is! UserPermanaHomeNumberDataNotExist) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: lightGreenColor,
                  ),
                  child: Column(
                    children: state.userPermanaHomeNumbers
                        .map(
                          (userPermanaHomeNumber) => PermanaHomeNumberItem(
                            permanaHomeNumber: userPermanaHomeNumber,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            );
          }

          if (state is UserPermanaHomeNumberDataNotExist) {
            return Center(
              child: Text(
                'Kosong',
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: bold,
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Hubungkan',
          onPressed: () {
            Navigator.pushNamed(context, '/hubungkan-permana-home-number');
          },
        ),
      ),
    );
  }
}

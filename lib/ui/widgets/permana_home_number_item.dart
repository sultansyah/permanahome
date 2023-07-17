import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/models/user_permana_home_number_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/user_permana_home_number/user_permana_home_number_bloc.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class PermanaHomeNumberItem extends StatelessWidget {
  final UserPermanaHomeNumber permanaHomeNumber;

  const PermanaHomeNumberItem({
    super.key,
    required this.permanaHomeNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: lightGreyColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (permanaHomeNumber.isActive == 1)
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Aktif',
                style: lightGreenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
            ),
          Text(
            permanaHomeNumber.permanaHomeNumberId.toString(),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomFilledButton(
                title: 'Hapus',
                height: 40,
                width: 120,
                onPressed: () => context
                    .read<UserPermanaHomeNumberBloc>()
                    .add(UserPermanaHomeNumberDelete(permanaHomeNumber.id!)),
              ),
              CustomFilledButton(
                title: 'Ganti',
                height: 40,
                width: 120,
                onPressed: () => context.read<UserPermanaHomeNumberBloc>().add(
                    UserPermanaHomeNumberUpdateIsActive(permanaHomeNumber.id!)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

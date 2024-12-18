import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/shared/shared_values.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/auth/auth_bloc.dart';
import 'package:permanahome/ui/widgets/profile_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/onboarding',
              (route) => false,
            );
          }
        },
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/img_profile.png'),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (globalUser != null)
                            ? (globalUser!.fullName != null)
                                ? globalUser!.fullName!
                                : ''
                            : '',
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        (globalUser != null)
                            ? (globalUser!.email != null)
                                ? globalUser!.email!
                                : ''
                            : '',
                        style: lightGreenTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileItem(
                title: 'Edit Profile',
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ProfileItem(
                title: 'Kelola Permana Home Number',
                onPressed: () {
                  Navigator.pushNamed(context, '/permana-home-number');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ProfileItem(
                title: 'Kirim Masukan',
                onPressed: () {
                  Navigator.pushNamed(context, '/masukan');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ProfileItem(
                title: 'Tentang Aplikasi Ini',
                onPressed: () {
                  Navigator.pushNamed(context, '/tentang');
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ProfileItem(
                title: 'Keluar',
                onPressed: () {
                  context.read<AuthBloc>().add(AuthLogout());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/models/user_model.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/auth/auth_bloc.dart';
import 'package:permanahome/ui/pages/set_page.dart';
import 'package:permanahome/ui/pages/terimakasih_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/forms.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final fullNameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final noHpController = TextEditingController(text: '');
  final noWaController = TextEditingController(text: '');

  bool validate() {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        noHpController.text.isEmpty ||
        noWaController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => TerimakasihPage(
                  ucapan: 'Proses Perubahan Berhasil',
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthGetCurrentUser());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetPage(
                          index: 4,
                        ),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
              (route) => false,
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess || state is AuthFailedUpdate) {
              if ((state as AuthSuccess).user.fullName != null &&
                  (state as AuthSuccess).user.email != null &&
                  (state as AuthSuccess).user.username != null &&
                  (state as AuthSuccess).user.password != null &&
                  (state as AuthSuccess).user.noHp != null &&
                  (state as AuthSuccess).user.noWa != null) {
                fullNameController.text = (state as AuthSuccess).user.fullName!;
                emailController.text = (state as AuthSuccess).user.email!;
                usernameController.text = (state as AuthSuccess).user.username!;
                passwordController.text = (state as AuthSuccess).user.password!;
                noHpController.text = (state as AuthSuccess).user.noHp!;
                noWaController.text = (state as AuthSuccess).user.noWa!;
              }

              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        CustomFormField(
                          title: 'Nama Lengkap',
                          controller: fullNameController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: 'Email',
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: 'Username',
                          controller: usernameController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: 'Password',
                          obsecureText: true,
                          controller: passwordController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: 'No Hp',
                          controller: noHpController,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomFormField(
                          title: 'No Wa',
                          controller: noWaController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomFilledButton(
                          title: 'Ubah',
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(AuthUpdateUser(UserModel(
                                  id: state.user.id,
                                  fullName: fullNameController.text,
                                  email: emailController.text,
                                  username: usernameController.text,
                                  password: passwordController.text,
                                  profilePicture: state.user.profilePicture,
                                  noHp: noHpController.text,
                                  noWa: noWaController.text,
                                )));
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

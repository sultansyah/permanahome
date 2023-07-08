import 'package:flutter/material.dart';
import 'package:permanahome/models/sign_up_form_model.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/pages/sign_up_set_profile_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';
import 'package:permanahome/ui/widgets/forms.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final namaLengkapController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final usernameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final alamatController = TextEditingController(text: '');
  final noHpController = TextEditingController(text: '');
  final noWaController = TextEditingController(text: '');

  bool validate() {
    if (namaLengkapController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        alamatController.text.isEmpty ||
        noHpController.text.isEmpty ||
        noWaController.text.isEmpty) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 100,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img_logo.png'),
              ),
            ),
          ),
          Text(
            'Saatnya #SamaPermana\ndan #ManjakanHarimu',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 30,
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
                  controller: namaLengkapController,
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
                  title: 'ALamat',
                  controller: alamatController,
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
                  title: 'Selanjutnya',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpSetProfilePage(
                          data: SignUpFormModel(
                            namaLengkap: namaLengkapController.text,
                            email: emailController.text,
                            username: usernameController.text,
                            password: passwordController.text,
                            alamat: alamatController.text,
                            noHp: noHpController.text,
                            noWa: noWaController.text,
                          ),
                        ),
                      ),
                    );

                    // if (validate()) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => SignUpSetProfilePage(
                    //         data: SignUpFormModel(
                    //           namaLengkap: namaLengkapController.text,
                    //           email: emailController.text,
                    //           username: usernameController.text,
                    //           password: passwordController.text,
                    //           alamat: alamatController.text,
                    //           noHp: noHpController.text,
                    //           noWa: noWaController.text,
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // } else {
                    //   showCustomSnackbar(context, 'Semua kolom harus diisi');
                    // }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextButton(
            title: 'Sudah punya akun? Masuk',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-in');
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

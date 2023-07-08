import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
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
      appBar: AppBar(title: const Text('Edit Profile')),
      body: ListView(
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
                  title: 'Ubah',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TerimakasihPage(
                          ucapan: 'Proses Perubahan Berhasil',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SetPage(
                                  index: 4,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SignUpSetProfilePage(
                    //       data: SignUpFormModel(
                    //         namaLengkap: namaLengkapController.text,
                    //         email: emailController.text,
                    //         username: usernameController.text,
                    //         password: passwordController.text,
                    //         alamat: alamatController.text,
                    //         noHp: noHpController.text,
                    //         noWa: noWaController.text,
                    //       ),
                    //     ),
                    //   ),
                    // );

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
        ],
      ),
    );
  }
}

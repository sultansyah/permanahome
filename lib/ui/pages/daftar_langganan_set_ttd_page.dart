import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:flutter/material.dart';
import 'package:permanahome/models/formulir_instalasi_model.dart';
import 'package:permanahome/shared/shareds_method.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/formulir_instalasi/formulir_instalasi_bloc.dart';
import 'package:permanahome/ui/pages/terimakasih_page.dart';
import 'package:permanahome/ui/widgets/buttons.dart';

class DaftarLanggananSetTtdPage extends StatefulWidget {
  final FormulirInstalasi formulirInstalasi;

  const DaftarLanggananSetTtdPage({
    super.key,
    required this.formulirInstalasi,
  });

  @override
  State<DaftarLanggananSetTtdPage> createState() =>
      _DaftarLanggananSetTtdPageState();
}

class _DaftarLanggananSetTtdPageState extends State<DaftarLanggananSetTtdPage> {
  String? gambarTtd;

  ByteData img = ByteData(0);
  var color = Colors.red;
  var strokeWidth = 5.0;
  final _sign = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: BlocProvider(
        create: (context) => FormulirInstalasiBloc(),
        child: BlocConsumer<FormulirInstalasiBloc, FormulirInstalasiState>(
          listener: (context, state) {
            if (state is FormulirInstalasiFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is FormulirInstalasiSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => TerimakasihPage(
                    ucapan:
                        'Terimakasih Sudah Berlangganan Kami akan memberitahukan kepada anda secepatnya',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    },
                  ),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is FormulirInstalasiLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                Container(
                  width: 155,
                  height: 50,
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/img_logo.png'),
                    ),
                  ),
                ),
                Text(
                  'Tanda Tangan di kotak bawah ini',
                  style: blackTextStyle.copyWith(
                    fontSize: 15,
                    fontWeight: semiBold,
                  ),
                ),
                Container(
                  width: 100,
                  height: 150,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: whiteColor,
                  ),
                  child: Signature(
                    color: color,
                    key: _sign,
                    onSign: () {},
                    strokeWidth: strokeWidth,
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    final sign = _sign.currentState;
                    sign!.clear();
                    setState(() {
                      img = ByteData(0);
                    });
                  },
                  child: Text(
                    "Bersihkan",
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomFilledButton(
                      title: 'Selanjutnya',
                      onPressed: () async {
                        await simpanTtd();

                        if (gambarTtd != null) {
                          context.read<FormulirInstalasiBloc>().add(
                                FormulirInstalasiAdd(
                                  widget.formulirInstalasi.copyWith(
                                    tandaTangan:
                                        'data:image/png;base64,' + gambarTtd!,
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackbar(context, 'Tanda Tangan Kosong');
                        }
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> simpanTtd() async {
    final sign = _sign.currentState;
    //retrieve image data, do whatever you want with it (send to server, save locally...)
    final image = await sign!.getData();
    var data = await image.toByteData(format: ui.ImageByteFormat.png);
    sign.clear();

    // final encoded = base64.encode(data!.buffer.asUint8List());
    setState(() {
      img = data!;
      gambarTtd = base64.encode(data.buffer.asUint8List());
    });
  }
}

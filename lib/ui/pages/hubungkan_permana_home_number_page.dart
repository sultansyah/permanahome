import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hubungkan'),
      ),
      body: Container(
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

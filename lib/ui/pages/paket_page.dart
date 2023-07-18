import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permanahome/shared/shareds_method.dart';

import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/widgets/paket_item.dart';

class PaketPage extends StatefulWidget {
  const PaketPage({super.key});

  @override
  State<PaketPage> createState() => _PaketPageState();
}

class _PaketPageState extends State<PaketPage> {
  @override
  Widget build(BuildContext context) {
    void get() async {
      Location location = Location(context: context);
      location.getCurrentPosition();

      print('current address = ${location.currentAddress}');
      print('current position = ${location.currentPosition}');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: lightGreenColor,
            ),
            child: Column(
              children: [
                PaketItem(
                  namaPaket: 'Lite',
                  kecepatan: '25 Down & 10 Mbps Up',
                  harga: 'Rp.249.000,-/BULAN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-paket');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PaketItem(
                  namaPaket: 'Smart',
                  kecepatan: '50 Down & 20 Mbps Up',
                  harga: 'Rp.369.000,-/BULAN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-paket');
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PaketItem(
                  namaPaket: 'HAPPY',
                  kecepatan: '100 Down & 30 Mbps Up',
                  harga: 'Rp.499.000,-/BULAN',
                  onPressed: () {
                    Navigator.pushNamed(context, '/detail-paket');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Location {
  final BuildContext context;

  Location({required this.context});

  String? currentAddress;
  Position? currentPosition;

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showCustomSnackbar(
        context,
        'Location services are disabled. Please enable the services',
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showCustomSnackbar(
          context,
          'Location permissions are denied',
        );
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showCustomSnackbar(
        context,
        'Location permissions are permanently denied, we cannot request permissions.',
      );
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      currentPosition = position;
      getAddressFromLatLng(currentPosition!);
    }).catchError((e) {
      showCustomSnackbar(context, e.toString());
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            currentPosition!.latitude, currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      currentAddress = '''${place.street}, ${place.subLocality},
          ${place.subAdministrativeArea}, ${place.postalCode}''';
    }).catchError((e) {
      showCustomSnackbar(context, e.toString());
    });
  }
}

import 'dart:async';

import 'package:geocoder/geocoder.dart';

Future latLngToAddress() async {
  final coordinates = Coordinates(1.10, 45.50);
  final addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  final first = addresses.first;
  print("${first.featureName} : ${first.addressLine}");
}

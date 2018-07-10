import 'dart:async';

import 'package:geocoder/geocoder.dart';

Future latLngToAddress() async {
  final coordinates = new Coordinates(1.10, 45.50);
  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);

  var first = addresses.first;
  print("${first.featureName} : ${first.addressLine}");
}

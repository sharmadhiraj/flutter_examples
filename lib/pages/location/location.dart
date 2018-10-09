import 'dart:async';
import 'package:geolocator/geolocator.dart';

import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Location"),
      ),
      body: Center(
        child: new FutureBuilder<Position>(
          future: Geolocator()
              .getCurrentPosition(desiredAccuracy: LocationAccuracy.high),
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text("No data");
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Text("Fetching Location");
              case ConnectionState.done:
                Position location = snapshot.data;
                return Text(snapshot.hasData
                    ? "Location: ${location.latitude},${location.longitude}"
                    : "Error");
            }
          },
        ),
      ),
    );
  }
}

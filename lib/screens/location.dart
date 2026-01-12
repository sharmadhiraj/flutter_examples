import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Location"),
      ),
      body: Center(
        child: FutureBuilder<Position>(
          future: Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(),
          ),
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("No data");
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Text("Fetching Location");
              case ConnectionState.done:
                final Position? location = snapshot.data;
                return Text(
                  snapshot.hasData && location != null
                      ? "Location: ${location.latitude},${location.longitude}"
                      : "Error",
                );
            }
          },
        ),
      ),
    );
  }
}

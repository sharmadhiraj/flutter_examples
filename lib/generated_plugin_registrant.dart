//
// Generated file. Do not edit.
//

// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:geolocator_web/geolocator_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';

// ignore: public_member_api_docs
void registerPlugins(Registrar registrar) {
  GeolocatorPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}

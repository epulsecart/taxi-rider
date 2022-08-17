import 'package:flutter/foundation.dart';

import './map_providers.dart';
import 'package:latlong2/latlong.dart';

String serverIP = "31.220.17.184";

bool demoMode = false;
String companyName = "ridy.io";
MapProvider mapProvider = MapProvider.googleMap;

// MapBox Configuration (Only if Map Provider is set to mapBox)
String mapBoxAccessToken = "";
String mapBoxUserId = "mapbox";
String mapBoxTileSetId = "streets-v11";

String loginTermsAndConditionsUrl = "";

String defaultCurrency = "USD";
String defaultCountryCode = "+1";
const List<double> tipPresets = [10, 20, 50];

LatLng fallbackLocation = LatLng(37.3382, -121.8863);

// Menu website url
String? websiteUrl;

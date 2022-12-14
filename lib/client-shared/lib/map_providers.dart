import 'package:flutter_map/flutter_map.dart';

import 'config.dart';

final TileLayerOptions openStreetTileLayer = TileLayerOptions(
    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
    subdomains: ['a', 'b', 'c'],
    maxNativeZoom: 18);

final TileLayerOptions mapBoxTileLayer = TileLayerOptions(
    urlTemplate:
        "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/256/{z}/{x}/{y}@2x?access_token=$mapBoxAccessToken",
    additionalOptions: {"access_token": mapBoxAccessToken},
    maxNativeZoom: 18);

enum MapProvider { googleMap,openStreetMap, mapBox }

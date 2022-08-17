import 'package:client_shared/config.dart';

String serverUrl = "http://31.220.17.184:4000/";
String wsUrl = serverUrl.replaceFirst("http", "ws");

// Nominatim configuration (Only for Open Street Maps and MapBox)
List<String>? nominatimCountries; // ISO 3166-1alpha2 codes

// Google Places Configuration (Only for Google Map Provider)
String placesApiKey = "AIzaSyClJchSAuHzo5eLYcpbntzMbMA-zzpX0WI";
String placesCountry = "en";

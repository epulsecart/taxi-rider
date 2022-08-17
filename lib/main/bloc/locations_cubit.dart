import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit() : super(LocationsState(null, null, true));

  void goToLoadingState(LatLng location) =>
      emit(LocationsState(location, null, true));

  void goToLoadedState(String address) =>
      emit(LocationsState(state.currentLocation, address, false));
}

class LocationsState {
  LatLng? currentLocation;
  String? address;
  bool isLoading;

  LocationsState(this.currentLocation, this.address, this.isLoading);
}

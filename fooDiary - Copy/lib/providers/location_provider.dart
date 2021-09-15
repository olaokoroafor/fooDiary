import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  //first element is latitude, second element is longitude
  Map<String,double> _usableLocation;

  Map<String,double> get usableLocation{
    return {..._usableLocation};
  }


  Future<LocationData> getLocation(location) async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  void assignLocation(loc) async {
    _usableLocation = loc;
    notifyListeners();
  }
}


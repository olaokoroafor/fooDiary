import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/restaurant_locations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantsNearMe with ChangeNotifier {
  List<RestaurantMapPoints> _items = [];

  List<RestaurantMapPoints> get items {
    return [..._items];
  }

  void addMarker(resitem) {
    _items.add(RestaurantMapPoints(
      id: resitem["id"],
      resname: resitem["name"],
      location: RestaurantLocs(
          resitem["region"]["center"]["latitude"],
          resitem["region"]["center"]["longitude"],
          "${resitem["location"]["address1"]}, ${resitem["location"]["zip_code"]}"),
    ));
  }

  gotodetailScreen(_context) {
    Navigator.pushNamed(_context, '/explore_restaurants_screen');
  }

  Set<Marker> getMarkers(ctx) {
    Set<Marker> _rmarkers = Set<Marker>();
    _items.forEach((element) {
      _rmarkers.add(Marker(
          markerId: MarkerId(element.id.toString()),
          position:
              LatLng(element.location.latitude, element.location.longitude),
          infoWindow: InfoWindow(
            title: element.resname + ":" + element.location.address,
          ),
          onTap: () => gotodetailScreen(ctx)));
    });
    final newset = _rmarkers.toSet();
    return _rmarkers;
  }
}

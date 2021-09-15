import 'package:flutter/material.dart';
import 'package:fooDiary/providers/location_provider.dart';
import 'package:fooDiary/providers/restaurants_nearme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

/* Future<LocationData> _getUserLocation() async {
  final locData = await Location().getLocation();
  //final latlang =
      //locData.latitude.toString() + "," + locData.longitude.toString();
  return locData;// latlang;
} */

//_getUserLocation();
//final mapviewlatlang = mapview.toString();
//final coordinates = mapviewlatlang.split(",");

/* Future<bool> assignService(Location loc) async {
  bool servicestatus = await loc.serviceEnabled();
  print("Service status $servicestatus");
  return servicestatus;
}

Future<PermissionStatus> assignPermission(Location loc) async {
  var hasPermission = await loc.hasPermission();
  print("Permission status $hasPermission");
  return hasPermission;
}

Location location = Location();

var _serviceEnabled;
var _serve = assignService(location).then((value) => _serviceEnabled = value);

//var _permissionGranted = assignPermission(location);
var _permissionGranted;
assignPermission(location).then((value) => _permissionGranted = value);

void startService() {
  if (!_serviceEnabled) {
    _serviceEnabled = assignService(location);
    print("service disabled");
    if (!_serviceEnabled) {
      return;
    }
  }

  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = assignPermission(location);
    print("permission denied");
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
} */

/* var map;
var rmarker;
BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/custom_marker.png')
    .then((value) => rmarker = value);
final mapp = location.getLocation().then((value) => map = value);

final _m1arkers = [
  Marker(
    markerId: MarkerId("my_location"),
    position: LatLng(41.16599, -110.75792),
    infoWindow: InfoWindow(title: "YOUR HOME"),
  ),
  Marker(
      markerId: MarkerId("RESTAURANT"),
      icon: rmarker,
      position: LatLng(40.16599, -110.75792),
      infoWindow: InfoWindow(title: "Restaurant"))
];
final setmarkers = _m1arkers.toSet(); */

void assignmarkers(context, list) {
  list.forEach((element) {
    Provider.of<RestaurantsNearMe>(context, listen: false).addMarker(element);
  });
}

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  //var _markerlist = restaurantmarkers;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //TO DO MAKES RUE YOU REMOVE THIS
    //assignmarkers(context, _markerlist);
  }

  @override
  Widget build(BuildContext context) {
    //final _restaurants = Provider.of<RestaurantsNearMe>(context, listen: false);
    //final _markers = _restaurants.getMarkers(context);
    //sample markers below
    final _markers = [
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(51.4899,-0.2071),
        onTap: () => Navigator.pushNamed(context, '/construction_screen')
      ),
      Marker(
        markerId: MarkerId("2"),
        position: LatLng(51.4652,-0.1708),
        onTap: () => Navigator.pushNamed(context, '/construction_screen')
      ),
      Marker(
        markerId: MarkerId("3"),
        position: LatLng(51.4912,-0.2273),
        onTap: () => Navigator.pushNamed(context, '/construction_screen')
      )
    ].toSet();
    final userLocation =
        Provider.of<LocationProvider>(context, listen: false).usableLocation;
    //final _mylocation = LocationHelper().getmyLoc();
    return /* !_serviceEnabled ? Center(child:Text("Page cannot be viewed"),) :
        map == null
            ? Center(
                child: Text("Null response"),
              )
            :*/
        Scaffold(
      body: userLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      /* _mylocation.latitude,
                    _mylocation.longitude  */
                      userLocation["latitude"],
                      userLocation["longitude"])),
              zoomControlsEnabled: true,
              myLocationEnabled: true,
              minMaxZoomPreference: MinMaxZoomPreference(2, 20),
              markers: _markers,
            ),
    );
  }
}

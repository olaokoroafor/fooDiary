import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:fooDiary/providers/location_provider.dart';

const yelp_key =
    "nyjLbjdF4e7j41AKZ_qohZTYO-_2P3t1fDwWcHAXMDnRQjySdk0I2jE6cTHdMras-ic5KocyjqiWdm96KkqdHvI4M9nMmFj5Fk1TK-38WBY7s6gONXxQ6mgNZ-zpXnYx";

Future<List<dynamic>> fetchRestaurants(context) async {
  final _location = Provider.of<LocationProvider>(context).usableLocation;
  final response = await http.get(
      'https://api.yelp.com/v3/businesses/search?latitude=${_location["latitude"]}&longitude=${_location["longitude"]}&limit=50&categories=food,restaurants',
      headers: {HttpHeaders.authorizationHeader: "Bearer $yelp_key"});
  if (response.statusCode == 200) {
    /* Map<String, dynamic> */ var data =
        (json.decode(response.body))["businesses"];
    //print(data);
/*     data.forEach((element) {
      print(element);
      Restaurant.fromJson(element);
    }); */
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Failed to load restaurants, please check internet connection and try again: ${json.decode(response.body)["error"]}');
  }
}

Future<List<dynamic>> searchRestaurants(context, term) async {
  final _location =
      Provider.of<LocationProvider>(context, listen: false).usableLocation;
  final response = await http.get(
      'https://api.yelp.com/v3/businesses/search?term=$term&latitude=${_location["latitude"]}&longitude=${_location["longitude"]}&limit=50&categories=food,restaurants',
      headers: {HttpHeaders.authorizationHeader: "Bearer $yelp_key"});
  if (response.statusCode == 200) {
    /* Map<String, dynamic> */ var data =
        (json.decode(response.body))["businesses"];
    //print(data);
/*     data.forEach((element) {
      print(element);
      Restaurant.fromJson(element);
    }); */
    return data;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(
        'Failed to load restaurants, please check internet connection and try again: ${json.decode(response.body)["error"]}');
  }
}

class Restaurant {
  final String resId;
  final String name;
  final String imageUrl;

  Restaurant({this.resId, this.name, this.imageUrl});

/*   factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      resId: json["id"],
      name: json["name"],
      imageUrl: json["image_url"],
    ); 
  }*/
}

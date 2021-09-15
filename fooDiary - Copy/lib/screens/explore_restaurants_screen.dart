import 'package:flutter/material.dart';
import 'package:fooDiary/data/restaurant_data.dart';
import 'package:fooDiary/helpers/getrestaurant_helper.dart';
import 'package:fooDiary/widgets/display_image.dart';


class ExploreRestaurantsScreen extends StatefulWidget {
  @override
  _ExploreRestaurantsScreenState createState() => _ExploreRestaurantsScreenState();
}

class _ExploreRestaurantsScreenState extends State<ExploreRestaurantsScreen> {
  List<dynamic> _restaurants;
  var _toUse;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _toUse = fetchRestaurants(context);
    _toUse.then((value) => _restaurants = value);
    //assignmarkers(_restaurants);

  }

  Widget build(BuildContext context) {
    return Scaffold(
          body: FutureBuilder<List<dynamic>>(
          future: _toUse,
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      height: 10,
                      //color: Colors.redAccent[100],
                    );
                  },
                  itemCount: 30,
                  itemBuilder: (_, index) {
                    dynamic _restaurant = _restaurants[index];
                    return DisplayImage(
                        resId: /* restaurant.resId, */ _restaurant["id"],
                        name: /* restaurant.name */ _restaurant["name"],
                        imageUrl: /* restaurant.imageUr */ _restaurant["image_url"]);
                  });
            }
/*           else if(snapshot.hasError){
            return Center(child: Text("${snapshot.error}"));
          } */
          return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fooDiary/providers/location_provider.dart';
import 'package:fooDiary/providers/restaurants_nearme.dart';
import 'package:fooDiary/screens/construction_screen.dart';
import 'package:fooDiary/screens/explore_restaurants_screen.dart';
import 'package:fooDiary/screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/nearby_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(
      create: (ctx)=> RestaurantsNearMe()),
      ChangeNotifierProvider(
      create: (ctx)=> LocationProvider()),],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(),
          '/nearby_screen': (context) => NearbyScreen(),
          '/settings_screen':(context) => SettingsScreen(),
          '/explore_restaurants_screen':(context) => ExploreRestaurantsScreen(),
          '/construction_screen':(context) => ConstructionScreen(),
        },
      ),
    );
  }
}

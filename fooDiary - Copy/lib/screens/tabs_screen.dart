import 'package:flutter/material.dart';

import 'package:fooDiary/providers/location_provider.dart';
import './explore_restaurants_screen.dart';
import './account_screen.dart';
import './search_screen.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';


class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var location = new Location();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<LocationProvider>(context, listen: false)
        .getLocation(location)
        .then((value) {
      Provider.of<LocationProvider>(context, listen: false).assignLocation(
          {"latitude": value.latitude, "longitude": value.longitude});
    });
  }

  void dispose() {
    super.dispose();
  }

  final List<Map<String, Object>> _pages = [
    {
      'page': ExploreRestaurantsScreen(),
      'title': 'Explore',
    },
    {
      'page': SearchScreen(),
      'title': 'Find',
    },
    {
      'page': AccountScreen(),
      'title': 'My Account',
    },
  ];
  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            _selectedPageIndex == 1 ? Colors.redAccent[100] : Colors.white,
        appBar: _selectedPageIndex == 1
            ? null
            : AppBar(
                leading: _selectedPageIndex == 2
                    ? IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings_screen');
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.place,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/nearby_screen');
                        },
                      ),
                title: Text("${_pages[_selectedPageIndex]['title']}"),
                backgroundColor: Colors.redAccent[100],
              ),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_dining,
              ),
              title: Text('Nearby'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.loyalty),
              title: Text('Find'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face), //fingerprint,
              title: Text('My Things'),
            ),
          ],
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _selectPage,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:fooDiary/helpers/getrestaurant_helper.dart';

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}



class _SearchScreenState extends State<SearchScreen> {
/*   Future<List<dynamic>> search(String search) {
  var _searchresults;
  final _toUse = searchRestaurants(context, search);
  _toUse.then((value) => _searchresults = value);
    print(_searchresults);
    return _toUse;
} */

  Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(search.length, (int index) {
    return Post(
      "Sample text : $search $index",
      "Description :$search $index",
    );
  });
}

  @override
  

  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SearchBar<Post>(
            minimumChars: 1,
            searchBarStyle: SearchBarStyle(
              backgroundColor: Colors.white70,
              padding: EdgeInsets.all(10),
              borderRadius: BorderRadius.circular(30),
              ),
            hintText: "Find your fav restaurants here...",
            onSearch: search,
            onItemFound: (post, int index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                  ),
                  Divider(height: 3)
                ],
              );
            }, 
          ),
        ),
      );
  }
}

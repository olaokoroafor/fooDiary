import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DisplayImage extends StatelessWidget {
  final String resId;
  final String name;
  final String imageUrl;

  DisplayImage({this.resId, this.name, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {Navigator.pushNamed(context, '/construction_screen');},
          child: Stack(
        children: <Widget>[
          imageUrl != ""
              ? Container(
                  child: CachedNetworkImage(
                      placeholder: (context, url) => LinearProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.amber),
                            backgroundColor: Colors.amberAccent[100],
                          ),
                      imageUrl: imageUrl,
                      fit: BoxFit.cover),
                  height: 300,
                  width: double.infinity,
                )
              : Container(
                  height: 300,
                  color: Colors.black,
                  width: double.infinity,
                  child: Icon(
                    Icons.restaurant,
                    size: 100,
                    color: Colors.redAccent[100],
                  )),
          Positioned(
            bottom: 20,
            right: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: 250,
                color: Colors.black54,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/* Image.network(
                imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ) */

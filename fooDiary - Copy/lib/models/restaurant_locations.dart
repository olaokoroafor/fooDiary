class RestaurantLocs{
  final double latitude;
  final double longitude;
  final String address;

  RestaurantLocs(this.latitude, this.longitude, this.address

  );
}

class RestaurantMapPoints{
final int id;
final String resname;
final RestaurantLocs location;

RestaurantMapPoints({this.id, this.resname, this.location}
);


}
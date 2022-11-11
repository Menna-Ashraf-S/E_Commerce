import 'dbHelper_fav.dart';

class Fav{
  int? id;
  late String imageURL;
  late String title;
  dynamic price;
  late double rate;

  Fav({
    this.id,
    required this.imageURL,
    required this.title,
    required this.price,
    required this.rate,
  });

  Fav.fromMap(Map<String, dynamic> map) {
    if (map[columnId] != null) id = map[columnId];
    title = map[columnTitle];
    imageURL = map[columnImageURL];
    price = map[columnPrice];
    rate = map[columnRate];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnTitle] = title;
    map[columnPrice] = price;
    map[columnImageURL] = imageURL ;
    map[columnRate] = rate ;
    return map;
  }
}

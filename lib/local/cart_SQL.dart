import 'package:flutter_pro/local/dbHelper_cart.dart';

class Carts {
  int? id;
  dynamic rating;
  late int count;
  late String image;
  late String name;
  dynamic price;
  late String category;
  late String title;
  late String description;


  Carts({
    this.id,
    required this.image,
    required this.price,
    required this.rating,
    required this.count,
    required this.category,
    required this.title,
    required this.description,
  });

  Carts.fromMap(Map<String, dynamic> map) {
    if (map[columnId] != null) id = map[columnId];
    image = map[columnImage];
    price = map[columnPrice];
    rating = map[columnRating];
    count = map[columnCount];
    category = map[columnCategory];
    title = map[columnTitle];
    description = map[columnDescription];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnImage]  = image;
    map[columnPrice] = price;
    map[columnCount] = count;
    map[columnRating] = rating;
    map[columnCategory] = category;
    map[columnTitle] = title;
    map[columnDescription] = description;
    return map;
  }
}

import 'dbHelper_fav.dart';

class Fav {
  int? id;
  late String imageURL;
  late String title;
  late String description;
  late String categoryName;
  dynamic count;
  dynamic price;
  dynamic rate;

  Fav({
    this.id,
    required this.description,
    required this.categoryName,
    required this.imageURL,
    required this.title,
    required this.price,
    required this.rate,
    required this.count,
  });

  Fav.fromMap(Map<String, dynamic> map) {
    if (map[columnId] != null) id = map[columnId];
    title = map[columnTitle];
    imageURL = map[columnImageURL];
    price = map[columnPrice];
    rate = map[columnRate];
    categoryName = map[columnCategoryName];
    description = map[columnDescription];
    count = map[columnCount];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnTitle] = title;
    map[columnPrice] = price;
    map[columnImageURL] = imageURL;
    map[columnRate] = rate;
    map[columnCategoryName] = categoryName;
    map[columnDescription] = description;
    map[columnCount] = count;

    return map;
  }
}

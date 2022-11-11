import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoriesAPI {
  Future<Model> getAllData() async {
    final http.Response request = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));
    if (request.statusCode < 210 && request.statusCode >= 200) {
      final List<dynamic> jsonBody = jsonDecode(request.body);
      Model model = Model.fromMap(jsonBody);
      return model;
    } else {
      throw ("RequestFailure" + request.body);
    }
  }
}
class Model{
  late List <dynamic> categories ;

  Model.fromMap(List<dynamic> list){
    this.categories=[];
    list.forEach((element) {
      categories.add(element);
    });
  }
}
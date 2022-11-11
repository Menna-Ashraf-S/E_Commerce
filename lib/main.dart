import 'package:flutter/material.dart';
import 'package:flutter_pro/pages/products.dart';
import 'local/dbHelper_fav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavProvider.instance.open();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: Products(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: null);
  }
}

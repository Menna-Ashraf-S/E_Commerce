import 'package:flutter/material.dart';
import 'package:flutter_pro/pages/home.dart';
import 'package:flutter_pro/pages/navigation.dart';
import 'package:flutter_pro/pages/products.dart';
import 'local/dbHelper_fav.dart';
import 'package:flutter_pro/pages/details.dart';
import 'package:flutter_pro/pages/detailsWO.dart';
import 'package:flutter_pro/pages/detailsWS.dart';
import 'package:flutter_pro/pages/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FavProvider.instance.open();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Navigation(),
        '/details': (context) => Details(),
        '/detailsWO': (context) => DetailsWO(),
        '/detailsWS': (context) => DetailsWS(),
      },
      // home: Navigation(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pro/pages/products.dart';

import '../network/api.getCategory.dart';
import '../network/api.getProducts.dart';
import 'cart.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? categoryName;
  int currentIndex = 0;
  List images = [
    "images/elec.jpg",
    "images/alma.jpg",
    "images/r.jpg",
    "images/lb.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 2.5,
          title: Text(
            'Category',
            style:TextStyle(fontSize: 26, color: Colors.black,),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(28),
            ),
          ),
          toolbarHeight: 60,
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,  MaterialPageRoute(
                  builder: (context) {
                    return CartScreen();
                  },
                ));
              },
            ),
            SizedBox(width: 14),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 25.0 , right: 10 ,left: 10),
          child: FutureBuilder(
            future: CategoriesAPI().getAllData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Model data = snapshot.data as Model;
                return GridView.builder(
                    itemCount: data.categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              categoryName=data.categories[index];
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Products(categoryName: categoryName.toString()),));
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height/5,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.asset(
                                "${images[index]}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "${data.categories[index]}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    });
              }
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),

      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../network/api.getCategory.dart';


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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Text("Categories",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                    // childAspectRatio: .5,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            categoryName=data.categories[index];
                            print(categoryName);

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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        selectedFontSize: 0,
        iconSize: 25,
        backgroundColor: Colors.grey[200],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey[500],
        selectedItemColor: Colors.grey[800],
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: (){},
              icon: Icon(Icons.home),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "",
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/Model_products/products.dart';
import 'package:flutter_pro/local/navigat_details.dart';
import 'package:flutter_pro/network/api.getProducts.dart';
import 'package:flutter_pro/pages/cart.dart';
import 'package:flutter_pro/pages/fav.dart';

class Products extends StatefulWidget {
  late String categoryName;
  @override
  State<Products> createState() => _ProductsState();

  Products({required this.categoryName });
}


class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
         title: Text(
           'Products',
           style:TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: Colors.black,),
         ),
        elevation: 2.5,
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
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen(),));
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite, size: 28, color: Colors.red[600]),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => FavList(),));
            },
          ),
          SizedBox(width: 5),
        ],
      ),
      body: FutureBuilder<List<ProductsData>>(
        future: Api_products().my_api(widget.categoryName),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: (0.82 / 1.32),
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                ProductsData product = snapshot.data![index];

                return GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 175,
                          height: 190,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              '${product.image}',
                              width: 175,
                              height: 190,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 175,
                            height: 51,
                            child: Text(
                              product.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(255, 150, 154, 156),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${product.price} \$ ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    if (product.category == 'electronics') {
                      Navigator.pushNamed(context, '/detailsWO',
                          arguments: Navigat_Details(
                              image: product.image,
                              title: product.title,
                              price: product.price.toDouble(),
                              description: product.description,
                              rating: product.rating.rate,
                              count: product.rating.count,
                              category: product.category));
                    } else if (product.category == 'jewelery') {
                      Navigator.pushNamed(context, '/detailsWS',
                          arguments: Navigat_Details(
                              image: product.image,
                              title: product.title,
                              price: product.price.toDouble(),
                              description: product.description,
                              rating: product.rating.rate,
                              count: product.rating.count,
                              category: product.category));
                    } else {
                      Navigator.pushNamed(context, '/details',
                          arguments: Navigat_Details(
                              image: product.image,
                              title: product.title,
                              price: product.price.toDouble(),
                              description: product.description,
                              rating: product.rating.rate,
                              count: product.rating.count,
                              category: product.category));
                    }
                    setState(() {});
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

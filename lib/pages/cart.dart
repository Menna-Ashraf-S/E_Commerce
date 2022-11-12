import 'package:flutter/material.dart';
import 'package:flutter_pro/Model_products/products.dart';
import 'package:flutter_pro/local/cart_SQL.dart';
import 'package:flutter_pro/local/dbHelper_cart.dart';
import 'package:flutter_pro/pages/products.dart';

import '../local/navigat_details.dart';

class CartScreen extends StatefulWidget {

  CartScreen({Key? key}) : super(key: key);
// ProductsData date;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int num = 1;
  // late int id;

  @override
  Widget build(BuildContext context) {
    List<Carts> carts = [];
    return Scaffold(
      appBar:  AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(28),
                ),
              ),
              toolbarHeight: 60,
              foregroundColor: Colors.black,
              elevation: 2.5,
              backgroundColor: Colors.grey[200],
              title: Center(
                child: Text(
                  'Cart',
                   style:TextStyle(fontSize: 26, color: Colors.black,),
                ),
              ),
            ),
      body: FutureBuilder<List<Carts>>(
          future: CartHelper.instance.getAllCarts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              carts = snapshot.data!;
               print(snapshot.data);
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: carts.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: GestureDetector(
                              onTap: () async {
                                if (carts[index].category == 'electronics') {
                                  Navigator.pushNamed(context, '/detailsWO',
                                      arguments: Navigat_Details(
                                          image: carts[index].image.toString(),
                                          title: carts[index].title,
                                          price: carts[index].price,
                                          description: carts[index].description.toString(),
                                          rating: double.parse(carts[index].rating.toString()),
                                          count: carts[index].count,
                                          category: carts[index].category));
                                } else if (carts[index].category == 'jewelery') {
                                  Navigator.pushNamed(context, '/detailsWS',
                                      arguments: Navigat_Details(
                                          image: carts[index].image.toString(),
                                          title: carts[index].title,
                                          price: carts[index].price,
                                          description: carts[index].description.toString(),
                                          rating: double.parse(carts[index].rating.toString()),
                                          count: carts[index].count,
                                          category: carts[index].category));
                                } else {
                                  Navigator.pushNamed(context, '/details',
                                      arguments: Navigat_Details(
                                          image: carts[index].image.toString(),
                                          title: carts[index].title,
                                          price: carts[index].price,
                                          description: carts[index].description.toString(),
                                          rating: double.parse(carts[index].rating.toString()),
                                          count: carts[index].count,
                                          category: carts[index].category));
                                }
                                setState(() {});
                              },
                              child: Card(
                                child: ListTile(
                                  leading: SizedBox(
                                      // height: 100,
                                      width: 70,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          carts.elementAt(index).image,
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ),
                                      )),
                                  title:  Padding(
                                    padding: EdgeInsets.all(
                                      10.0,
                                    ),
                                    child: Text(
                                      carts.elementAt(index).title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(
                                      8.0,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              '${carts.elementAt(index).price.toString()}\$',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     const Text(
                                        //       'QTY:',
                                        //       style: TextStyle(
                                        //           fontSize: 20,
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //     Text(
                                        //       '$num',
                                        //       style: const TextStyle(
                                        //           fontSize: 20,
                                        //           color: Colors.black,
                                        //           fontWeight: FontWeight.bold),
                                        //     )
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                  trailing: Column(
                                    children: [
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(8.0),
                                      //   child: Container(
                                      //     height: 25,
                                      //     width: 30,
                                      //     color: Colors.black12,
                                      //     child:
                                      //     IconButton(
                                      //       onPressed: () {
                                      //         setState(() {
                                      //           num++;
                                      //         });
                                      //       },
                                      //       color: Colors.white,
                                      //       icon: const Icon(
                                      //         Icons.add,
                                      //         color: Colors.black,
                                      //         size: 12.5,
                                      //       ),
                                      //     ),
                                      //     IconButton(onPressed: (){
                                      //       setState(() {
                                      //         CartHelper.instance
                                      //             .deleteCart(carts[index].id!);
                                      //       });
                                      //       }, icon: Icon(Icons.delete),),
                                      //
                                      //   ),
                                      // ),
                                      // const SizedBox(
                                      //   height: 3,
                                      // ),
                                      // ClipRRect(
                                      //   borderRadius: BorderRadius.circular(8.0),
                                      //   child: Container(
                                      //     height: 25,
                                      //     width: 30,
                                      //     color: Colors.black12,
                                      //     child: IconButton(
                                      //       onPressed: () {
                                      //         setState(() {
                                      //           num == 1 ? num = 1 : num--;
                                      //         });
                                      //       },
                                      //       icon: const Icon(
                                      //         Icons.remove,
                                      //         color: Colors.black,
                                      //         size: 12.5,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // SizedBox(height: 15,),
                                      IconButton(onPressed: (){
                                        setState(() {
                                          CartHelper.instance
                                              .deleteCart(carts[index].id!);
                                        });
                                      }, icon: Icon(Icons.delete, size: 30, color: Colors.red,),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                  )
                ],
              );
            }
            if (snapshot.hasError) {
              print(snapshot.error);
              return Container();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

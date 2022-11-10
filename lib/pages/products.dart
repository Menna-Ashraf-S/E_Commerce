import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pro/Model_products/products.dart';
import 'package:flutter_pro/network/api.getProducts.dart';

import 'details.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'product',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<ProductsData>>(
          future: Api_products().my_api(),
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
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 175,
                                  child: Text(
                                    product.title,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '${product.price} \$',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                      ),
                      onTap: () async {
                        setState(
                          () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) => Details(
                            //       title: product.title,
                            //       imageURL: product.image,
                            //       price: product.price,
                            //       rate: product.rating.rate,
                            //       description: product.description,
                            //     ),
                            //   ),
                            // );
                          },
                        );
                      },
                    );
                  });
            }
          }),
    );
  }
}

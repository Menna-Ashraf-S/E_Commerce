import 'package:flutter/material.dart';
import 'package:flutter_pro/local/dbHelper_fav.dart';

import '../local/fav_SQL.dart';

class FavList extends StatefulWidget {
  @override
  State<FavList> createState() => _FavListState();
}

List<Fav> favList = [];

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Fav>>(
      future: FavProvider.instance.getFav(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.hasData) {
          favList = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Favourite List',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
              shrinkWrap: true,
              children: List<Widget>.generate(
                favList.length,
                (index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('return To details page');
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => null,));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: GridTile(
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              Container(
                                                  width: 175,
                                                  height: 190,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.network(
                                                      '${favList[index].imageURL}',
                                                      width: 175,
                                                      height: 190,
                                                    ),
                                                  )),
                                              Stack(
                                                alignment:
                                                    AlignmentDirectional.center,

                                                children: [
                                                  Container(
                                                    width: 65,
                                                    height: 65,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    width: 53,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40),
                                                      color: Colors.black.withOpacity(0.45),
                                                    ),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          FavProvider.instance
                                                              .delete(
                                                            favList[index].title,
                                                          );
                                                        });
                                                      },
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        size: 37,
                                                      ),
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(
                                              child: Text(
                                            favList[index].title,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 14),
                                          )),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${favList[index].price.toString()} \$',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                width: 60,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.black,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      '${favList[index].rate}',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
        return CircularProgressIndicator(
          color: Colors.black,
        );
      },
    );
  }
}

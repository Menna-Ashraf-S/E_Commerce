import 'package:flutter/material.dart';
import 'package:flutter_pro/local/dbHelper_fav.dart';
import '../local/fav_SQL.dart';
import '../local/navigat_details.dart';

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
                  'Favourite List',
                   style:TextStyle(fontSize: 26, color: Colors.black,),
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
                      onTap: () async {
                        print('${favList[index].imageURL.toString()}');
                        if (favList[index].categoryName == 'electronics') {
                          Navigator.pushNamed(context, '/detailsWO',
                              arguments: Navigat_Details(
                                  image: favList[index].imageURL,
                                  title: favList[index].title,
                                  price: favList[index].price,
                                  description: favList[index].description,
                                  rating: favList[index].rate,
                                  count: favList[index].count,
                                  category: favList[index].categoryName));
                        } else if (favList[index].categoryName == 'jewelery') {
                          Navigator.pushNamed(context, '/detailsWS',
                              arguments: Navigat_Details(
                                  image: favList[index].imageURL,
                                  title: favList[index].title,
                                  price: favList[index].price,
                                  description: favList[index].description,
                                  rating: favList[index].rate,
                                  count: favList[index].count,
                                  category: favList[index].categoryName));
                        } else {
                          Navigator.pushNamed(
                            context,
                            '/details',
                            arguments: Navigat_Details(
                              image: favList[index].imageURL,
                              title: favList[index].title,
                              price: favList[index].price,
                              description: favList[index].description,
                              rating: favList[index].rate,
                              count: favList[index].count,
                              category: favList[index].categoryName,
                            ),
                          );
                        }
                        setState(() {

                        });

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
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                child: Container(
                                                  height: 45,
                                                  width: 45,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    //color: Colors.black.withOpacity(0.15),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        FavProvider.instance
                                                            .delete(
                                                          favList[index].id!,
                                                        );
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      size: 30,
                                                    ),
                                                    color: Colors.red,
                                                  ),
                                                ),
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
                                            ),
                                          ),
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
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                                                    SizedBox(
                                                      width: 2,
                                                    ),
                                                    Icon(
                                                      Icons.star,
                                                      size: 22,
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

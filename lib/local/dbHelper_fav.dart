import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'fav_SQL.dart';

final String columnId = 'id';
final String columnTitle = 'title';
final String columnImageURL = 'imageURL';
final String columnPrice = 'price';
final String columnRate = 'rate';
final String columnCategoryName = 'categoryName';
final String columnDescription = 'description';
final String columnCount = 'count';
final String productsTable = 'products_table';

class FavProvider {
  late Database db;

  static final FavProvider instance = FavProvider._internal();

  factory FavProvider() {
    return instance;
  }

  FavProvider._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'favourite.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
create table $productsTable ( 
  $columnId integer primary key autoincrement, 
  $columnTitle integer not null,
  $columnImageURL integer not null,
  $columnDescription integer not null,
  $columnCategoryName integer not null,
  $columnRate real not null,
  $columnCount integer not null,
  $columnPrice real not null
  )
''');
        });
  }

  Future<Fav> insert(Fav fav) async {
    fav.id = await db.insert(productsTable, fav.toMap());
    return fav;
  }

  Future<List<Fav>> getFav() async {
    List<Map<String, dynamic>> taskMaps = await db.query(productsTable);
    if (taskMaps.isEmpty) {
      return [];
    } else {
      List<Fav> tasks = [];
      taskMaps.forEach((element) {
        tasks.add(Fav.fromMap(element));
      });
      return tasks;
    }
  }

  Future<int> delete(int id) async {
    return await db.delete(productsTable, where: '$columnId = ?', whereArgs: [id]);
  }
  Future<int> deleteTitle(String title) async {
    return await db.delete(productsTable, where: '$columnTitle = ?', whereArgs: [title]);
  }

  Future<int> update(Fav fav) async {
    return await db.update(productsTable, fav.toMap(),
        where: '$columnId = ?', whereArgs: [fav.id]);
  }

  Future close() async => db.close();
}

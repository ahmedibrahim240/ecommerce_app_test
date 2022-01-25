// import 'package:ecommerce_app/models/cart_product_models.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// const String dbName = 'cartproduct.db';
// const String tableName = 'product';
// const String columnTitle = 'tilte';
// const String columnImage = 'image';
// const String columnProductId = 'productId';
// const String columnPrice = 'price';
// const String columnQuantity = 'quantity';

// class DbHelper {
//   static final DbHelper _indtance = DbHelper.internal();
//   factory DbHelper() => _indtance;
//   DbHelper.internal();
//   static Database? _db;
//   Future<Database> createDataBase() async {
//     if (_db != null) {
//       return _db!;
//     }
//     String path = join(await getDatabasesPath(), dbName);
//     _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
//       db.execute(''' 
//         create table $tableName(
//           id integer primary key autoincrement,
//           $columnTitle TEXT NOT NULL,
//           $columnImage TEXT NOT NULL,
//           $columnProductId TEXT NOT NULL,
//           $columnQuantity INTEGER NOT NULL,
//           $columnPrice DOUBLE NOT NULL)
//           ''');
//     });

//     return _db!;
//   }

//   Future<int> insertProduct(CartProductMoldes product) async {
//     Database db = await createDataBase();
//     return db.insert(
//       tableName,
//       product.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   allProduct() async {
//     Database db = await createDataBase();
//     return db.query(
//       tableName,
//     );
//   }

//   Future<int> deleteProduct(int? id) async {
//     Database db = await createDataBase();
//     return db.delete(tableName, where: 'id=?', whereArgs: [id]);
//   }

//   Future<CartProductMoldes?> getProductById(String id) async {
//     Database db = await createDataBase();
//     var result =
//         await db.query(tableName, where: '$columnProductId=?', whereArgs: [id]);
//     return result.isNotEmpty ? CartProductMoldes.formMap(result.first) : null;
//   }

//   deleteAllProduct() async {
//     Database db = await createDataBase();
//     return db.delete(tableName);
//   }

//   updateProduct(CartProductMoldes product) async {
//     Database db = await createDataBase();
//     return await db.update(
//       tableName,
//       product.toMap(),
//       where: '$columnProductId=?',
//       whereArgs: [product.productId],
//     );
//   }
// }

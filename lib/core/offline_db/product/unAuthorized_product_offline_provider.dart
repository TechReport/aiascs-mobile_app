import 'package:aiascs_mobile/core/offline_db/offline_db_provder.dart';
import 'package:aiascs_mobile/models/UnAuthorized_Product.dart';
import 'package:sqflite/sqflite.dart';

class UnAuthorizedProductOfflineProvider extends OfflineDbProvider {
  //columns
  String table = "unAuthorizedProduct";
  String id = "id";
  String isRevoked = "isRevoked";
  String name = "name";
  String companyName = "companyName";
  String descriptions = "descriptions";
  String photoUrl = "photoUrl";
  addOrUpdateProduct(UnAuthorizedProduct unAuthorizedProduct) async {
    var dbClient = await db;
    await dbClient.insert(
        table, unAuthorizedProduct.toOffline(unAuthorizedProduct),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteuproduct(String productId) async {
    var dbClient = await db;
    return await dbClient
        .delete(table, where: '$id = ?', whereArgs: [productId]);
  }

  Future<UnAuthorizedProduct> getSingleProduct(String product) async {
    UnAuthorizedProduct offlineProduct;
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        where: '$id = ?',
        whereArgs: [product],
        columns: [
             id,
   isRevoked,
   name,
   companyName,
   descriptions,
   photoUrl
        ],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          UnAuthorizedProduct newProduct = UnAuthorizedProduct.fromOffline(map);
          offlineProduct = newProduct;
        }
      }
    } catch (e) {}
    return offlineProduct;
  }

  Future<List<UnAuthorizedProduct>> getProducts() async {
    List<UnAuthorizedProduct> offlineProduct = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [
          isRevoked,
   name,
   companyName,
   descriptions,
   photoUrl
        ],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          UnAuthorizedProduct newProduct = UnAuthorizedProduct.fromOffline(map);
          offlineProduct.add(newProduct);
        }
      }
    } catch (e) {}
    return offlineProduct;
  }
}

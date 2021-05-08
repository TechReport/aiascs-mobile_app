import 'package:aiascs_mobile/core/offline_db/offline_db_provder.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:sqflite/sqflite.dart';

class ProductOfflineProvider extends OfflineDbProvider {
  //columns
   String table = "product";
   String id = "id";
   String isRevoked = "isRevoked" ;
   String token = "token";
   String name = "name";
   String expiryDate = "expiryDate";
   String companyId = "companyId";
   String companyRegNo = "companyRegNo";
   String companyName = "companyName";
   String companyPhoneNo = "companyPhoneNo";
   String companyEmail = " companyEmail";

  addOrUpdateProduct(Product product) async {
    var dbClient = await db;
    await dbClient.insert(table, product.toOffline(product),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  deleteuproduct(String productId) async {
    var dbClient = await db;
    return await dbClient.delete(table, where: '$id = ?', whereArgs: [productId]);
  }

  Future<Product> getSingleProduct(String product) async {
    Product offlineProduct;
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        where: '$id = ?',
        whereArgs: [product],
        columns: [id, isRevoked, token, name, expiryDate, companyId,companyRegNo,companyName,companyPhoneNo,companyEmail],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          Product newProduct = Product.fromOffline(map);
          offlineProduct = newProduct;
        }
      }
    } catch (e) {}
    return offlineProduct;
  }

    Future<List<Product>> getProducts() async {
    List<Product> offlineProduct = [];
    try {
      var dbClient = await db;
      List<Map> maps = await dbClient.query(
        table,
        columns: [id, isRevoked, token, name, expiryDate, companyId,companyRegNo,companyName,companyPhoneNo,companyEmail],
      );
      if (maps.isNotEmpty) {
        for (Map map in maps) {
          Product newProduct = Product.fromOffline(map);
          offlineProduct.add(newProduct);
        }
      }
    } catch (e) {}
    return offlineProduct;
  }
}

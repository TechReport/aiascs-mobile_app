import 'dart:convert';

import 'package:aiascs_mobile/core/offline_db/product/product_offline_provider.dart';
import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//
// => "GROWING WITH AGILE"
//

class ScanService {
  Future<Product> scan({String productTokenID}) async {
    print(productTokenID);
    final String scanUrl = "/api/v1/products/productToken/$productTokenID";
    String token = await PreferenceProvider.getPreferenceValue("token");
    print("in scan token");
    Response response =
        await HttpService().httpGet(scanUrl.trim(), token: token);
    if (response.statusCode == 200) {
      print("in scan status code");
      print(response.body);
      var responseData = json.decode(response.body);

      Product product = Product.fromJson(responseData);
      onSaveProductToOffline(product);
      return product;
    }
    print("in scan status aout of status code");
    print(response.statusCode);

    return null;
  }

  Future<Product> onRetrieveProductFromOffline(String productId) async {
    Product product;
    product = await ProductOfflineProvider().getSingleProduct(productId);
    return product;
  }

  void onSaveProductToOffline(Product product) async {
    ProductOfflineProvider().addOrUpdateProduct(product);
  }

  Future<List<Product>> onRetrievePrdoctListOffline() async {
    return await ProductOfflineProvider().getProducts();
  }

// on delete user after logout by user id

  Future<bool> onRevokeProduct(String productId) async {
    final String scanUrl = "/api/v1/products/revoke/$productId";
    String token = await PreferenceProvider.getPreferenceValue("token");
    // Map<String, dynamic> postData = {
    //   "isRevoked":true
    // };
    Response response =
        await HttpService().httpGet(scanUrl.trim(), token: token);
    if (response.statusCode == 201) {
      print("on revoke");
      // print(response.body);
      // var responseData = json.decode(response.body);
      // print(responseData);
      
      return true;
    }
    print(response.statusCode);
    return false;
  }
}

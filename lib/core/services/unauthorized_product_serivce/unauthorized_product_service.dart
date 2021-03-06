import 'dart:convert';

import 'package:aiascs_mobile/core/offline_db/product/product_offline_provider.dart';
import 'package:aiascs_mobile/core/offline_db/product/unAuthorized_product_offline_provider.dart';
import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:aiascs_mobile/models/UnAuthorized_Product.dart';
import 'package:http/http.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//
// => "GROWING WITH AGILE"
//

class UnAuthorizedProductService {
  Future<bool> postUnAuthorizedProduct(String photo, String companyName,
      String description, String productName) async {
    final String scanUrl = "/api/v1/products/report";
    String token = await PreferenceProvider.getPreferenceValue("token");
    Map<String, dynamic> postData = {
      "name": productName,
      "companyName": companyName,
      "descriptions": description,
    };

    print(postData);
    Map<String, dynamic> response = await HttpService().postData(
      postData,
      photo,
      scanUrl,
      token: token,
    );
    UnAuthorizedProduct unAuthorizedProduct =
        UnAuthorizedProduct.fromJson(response);
    onSaveUnAuthProductToOffline(unAuthorizedProduct);
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

  Future<Product> onRevokeProduct(String productId) async {
    final String scanUrl = "/api/v1/products/revoke/$productId";
    String token = await PreferenceProvider.getPreferenceValue("token");
    Map<String, dynamic> postData = {};
    Response response =
        await HttpService().htthPatch(scanUrl.trim(), postData, token: token);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      Product product = Product.fromJson(responseData);
      onSaveProductToOffline(product);
      return product;
    }
    print(response.body);
    return null;
  }

  void onSaveUnAuthProductToOffline(UnAuthorizedProduct product) async {
    UnAuthorizedProductOfflineProvider().addOrUpdateProduct(product);
  }

   Future<List<UnAuthorizedProduct>> onRetrieveUnAuthPrdoctListOffline() async {
    return await UnAuthorizedProductOfflineProvider().getProducts();
  }
}

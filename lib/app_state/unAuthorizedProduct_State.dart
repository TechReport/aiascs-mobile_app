import 'package:aiascs_mobile/core/services/unauthorized_product_serivce/unauthorized_product_service.dart';
import 'package:aiascs_mobile/models/UnAuthorized_Product.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class UnAuthorizedProductState extends ChangeNotifier {
//
//init state

  bool _isLoading;
  List<UnAuthorizedProduct> _listUnAuthProduct = [];
  UnAuthorizedProduct _currentUnAuthorizedProduct;

//selector
  bool get isLoading => _isLoading ?? false;
  List<UnAuthorizedProduct> get listUnAuthProduct => _listUnAuthProduct ?? [];
  UnAuthorizedProduct get currentUnAuthiredProduct =>
      _currentUnAuthorizedProduct;
//reducer

  Future<void> onPostProduct(String photoPath, String companyName,
      String description, String productName) async {
    _isLoading = true;
    notifyListeners();
    await UnAuthorizedProductService().postUnAuthorizedProduct(
        photoPath, companyName, description, productName);
    _isLoading = false;
    notifyListeners();
  }

  Future onRetrieveUnAuthroduct() async {
    _listUnAuthProduct =
        await UnAuthorizedProductService().onRetrieveUnAuthPrdoctListOffline();
    print("data in lists");
    print(_listUnAuthProduct.length);
    notifyListeners();
  }

  onSetCurrentAuthirizedProduct(UnAuthorizedProduct authorizedProduct) {
    _currentUnAuthorizedProduct = authorizedProduct;
    notifyListeners();
  }
}

import 'package:aiascs_mobile/core/services/unauthorized_product_serivce/unauthorized_product_service.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class UnAuthorizedProductState extends ChangeNotifier {
//
//init state

  bool _isLoading;

//selector
  bool get isLoading => _isLoading ?? false;
//reducer

  Future<void> onPostProduct(String photoPath, String companyName, String description,
      String productName) async {
    _isLoading = true;
    notifyListeners();
    await UnAuthorizedProductService().postUnAuthorizedProduct(
        photoPath, companyName, description, productName);
    _isLoading = false;
    notifyListeners();
  }
}

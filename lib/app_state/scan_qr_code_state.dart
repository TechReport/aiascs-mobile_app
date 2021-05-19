import 'package:aiascs_mobile/core/services/scan_service.dart/Scan_service.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:flutter/foundation.dart';

class ScanQrCodeState extends ChangeNotifier {
//initiate state
  bool _isLoading;
  Product _currentProduct;
//
// selector
  bool get isLoading => _isLoading ?? false;
  Product get currentProduct => _currentProduct;

// reducers

  Future scanQrCode({String qrInfo}) async {
    _isLoading = true;
    notifyListeners();
    Product product = await ScanService().scan(productTokenID: qrInfo);
    if (product != null) {
      _currentProduct = product;
      _isLoading = false;
      notifyListeners();
    } else {
      _isLoading = true;
      notifyListeners();
    }
  }

  Future<bool> revokeProduct(String productId) async {
    _isLoading = true;
    notifyListeners();
    Product product = await ScanService().onRevokeProduct(productId);
    if (product != null) {
      _currentProduct = product;
      _isLoading = false;
      notifyListeners();
      return true;
    } else {
      _isLoading = true;
      notifyListeners();
      return false;
    }
  }

  void clear() {
    _isLoading = false;
  }
}

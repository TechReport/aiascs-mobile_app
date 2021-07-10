import 'package:aiascs_mobile/core/services/scan_service.dart/Scan_service.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:flutter/foundation.dart';

class ScanQrCodeState extends ChangeNotifier {
//initiate state
  bool _isLoading;
  Product _currentProduct;
  bool _isQRLoading;
  bool _isRevoked;
  bool _isValidate;

//
// selector
  bool get isLoading => _isLoading ?? false;
  Product get currentProduct => _currentProduct;
  bool get isQRLoading => _isQRLoading ?? false;
  bool get isRevoked => _isRevoked ?? false;
  bool get isValidate => _isValidate ?? false;

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
      _isLoading = false;
      notifyListeners();
    }
  }

  Future scanQrCode2({String qrInfo}) async {
    _isQRLoading = true;
    notifyListeners();
    Product product = await ScanService().scan(productTokenID: qrInfo);
    if (product != null) {
      _currentProduct = product;
      _isQRLoading = false;
      notifyListeners();
    } else {
      _isQRLoading = true;
      notifyListeners();
    }
  }

  Future<void> revokeProduct(String productId) async {
    _isLoading = true;
    notifyListeners();
    print("in state");

    if (await ScanService().onRevokeProduct(productId)) {
      currentProduct.isRevoked = "true";
      ScanService().onSaveProductToOffline(currentProduct);
      // _currentProduct = product;
      _isLoading = false;
      _isRevoked = true;
      notifyListeners();
    } else {
      _isLoading = false;
      _isRevoked = true;
      notifyListeners();
    }
  }

  onSetCurrentProduct(Product product) {
    _currentProduct = product;
    notifyListeners();
  }

  onvalidateLoader(bool onValidate) {
    _isValidate = onValidate;
    notifyListeners();
  }

  void clear() {
    _isLoading = false;
  }
}

import 'package:aiascs_mobile/app_state/unAuthorizedProduct_State.dart';
import 'package:aiascs_mobile/core/services/scan_service.dart/Scan_service.dart';
import 'package:aiascs_mobile/models/Product.dart';

//
// Name: Danford Kija David
// Email: kijadanford@gmail.com,
// phoneNo: +255620419226
//
// => "GROWING WITH AGILE"
//

class ProductState extends UnAuthorizedProductState {
  List<Product> _productLists;
  bool _isLoading;
  double _countFakeProduct = 0;
  double _countAllProduct = 0;
  double _countGenuineProduct = 0;
  bool _isvisual;

  List<Product> get productList => _productLists ?? [];
  bool get isProductLoading => _isLoading ?? false;
  double get countFakeProduct => _countFakeProduct ?? 0;
  double get countAllProductProduct => _countAllProduct ?? 0;
  double get countGenuineProduct => _countGenuineProduct ?? 0;
  bool get isVisual => _isvisual ?? false;

  void getProductList() async {
    _isLoading = true;
    notifyListeners();
    _productLists = await ScanService().onRetrievePrdoctListOffline();
    _isLoading = false;
    notifyListeners();
  }

  Future onVisualisationProductDetails() async {
    List fake = [];
    List genuine = [];
    for (Product product in await ScanService().onRetrievePrdoctListOffline()) {
      if (product.isRevoked == "false") {
        genuine.add(product);
      } else {
        fake.add(product);
      }
      //   _countAllProduct = productList.length as double;
    }
    _countFakeProduct = fake.length.toDouble();
    _countGenuineProduct = genuine.length.toDouble();
    notifyListeners();
  }

  void setVisualonReportTopBar(bool value) {
    _isvisual = value;
    notifyListeners();
  }

  void clearState() {
    _isLoading = false;
  }
}

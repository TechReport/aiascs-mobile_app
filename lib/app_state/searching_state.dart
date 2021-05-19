import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/models/Product.dart';

class SearchingState extends ProductState {
  List<Product> _searchedProduct;
  bool _isSearch;

  List<Product> get searchedProduct => _searchedProduct ?? [];
  bool get isSearch => _isSearch ?? false;

  void getSearchingField(String value) {
    getProductList();
    productList;   
     List<Product> searchArray = [];
    for (Product product in productList) {  
      if (product.name.contains(value) ||
          product.companyName.contains(value) ||
          product.isRevoked.contains(value) ||
          product.companyEmail.contains(value) ||
          product.token.contains(value)) {
        searchArray.add(product);
      }
    }
    _searchedProduct = searchArray;
    notifyListeners();
  }

  void searchStatus(bool searchStatus) {
    _isSearch = searchStatus;
    notifyListeners();
  }
}

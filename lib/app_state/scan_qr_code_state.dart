import 'package:flutter/foundation.dart';

class ScanQrCodeState extends ChangeNotifier {
//initiate state
  bool _isLoading ;

// selector
  bool get isLoading => _isLoading ?? false;

// reducers

  void setIsLoading(bool loadingValue) {
    _isLoading = loadingValue;
  }
}

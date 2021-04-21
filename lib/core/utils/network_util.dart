import 'package:connectivity/connectivity.dart';

class NetworkCheck {
 Future<bool> check() async {
        var connectivityResult = await (Connectivity().checkConnectivity());
        if (connectivityResult == ConnectivityResult.mobile) {
          return true;
        } else if (connectivityResult == ConnectivityResult.wifi) {
          return true;
        }
        return false;
      }




// check().then((intenet) {
//       if (intenet != null && intenet) {
//         // Internet Present Case
//       }
//       // No-Internet Case
//     });


}
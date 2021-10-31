import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:ecommerce_app/core/services/enums/connectivity_status.dart';

class ConnectivityService {
  //! Create our public controller

  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    // !Subscribe to the connectivity Chanaged Steam
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        connectionStatusController.add(_getStatusFromResult(result));
      },
    );
  }

  getIntState() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    var intitState = _getStatusFromResult(connectivityResult);

    return intitState;
  }

  // !Convert from the third part enum to our own enum
  ConnectivityStatus _getStatusFromResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;

      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }
}

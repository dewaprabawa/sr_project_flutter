import 'package:connectivity/connectivity.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  final Connectivity connectionChecker;

  NetworkStatusImpl(this.connectionChecker);

  Future<bool> _isConnecting() async {
    final connectionResult = await connectionChecker.checkConnectivity();
    if (connectionResult == ConnectivityResult.mobile ||
        connectionResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> get isConnected => _isConnecting();
}

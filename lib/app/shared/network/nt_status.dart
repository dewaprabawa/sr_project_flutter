import 'package:connectivity/connectivity.dart';

abstract class NetworkStatus {  
  Future<ConnectivityResult> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  final Connectivity connectionChecker;

  NetworkStatusImpl(this.connectionChecker);

  @override
  Future<ConnectivityResult> get isConnected => connectionChecker.checkConnectivity();
}
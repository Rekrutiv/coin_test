
import 'package:coin_test/data/services/currency.dart';
import 'package:coin_test/models/coinbase_response_model.dart';

import '../../main.dart';

class ApiRepository {
  final _provider  = injector.get<CoinApi>();


  Future<CoinbaseResponse> fetchCoin(String coin ) {
    return _provider.getCoins(coin);
  }
}

class NetworkError extends Error {}
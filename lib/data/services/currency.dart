
import 'package:coin_test/data/services/socket_service.dart';
import 'package:dio/dio.dart';

import '../../config.dart';
import '../../main.dart';

const apiKey = 'EEC8C305-A172-4709-8EE0-9F8239BF7CE7';
const coinApiUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinApi {
  final SocketService socketService = injector.get<SocketService>();
  final dio = injector.get<Dio>();

  Future<dynamic> getCoins(String currencySelected) async {
    String url = config.baseUrl + 'v1/exchangerate/UAH/$currencySelected';
    final Response response = await dio.get(url);
    print('data $response');
    socketService.createCoinConnection(apiKey);


    return response.data;
  }

  String getCoinsWebsocket() {

    socketService.createCoinConnection(apiKey);
    // socketService.coinSocket
    //     .on('unreadTokMessages', (dynamic coins) {
    //
    //
    // });
    return 'ii';
  }
}

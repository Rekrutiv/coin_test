import 'package:coin_test/data/services/socket_service.dart';
import 'package:coin_test/models/coinbase_response_model.dart';
import 'package:coin_test/models/srcsidebase_model.dart';
import 'package:dio/dio.dart';

import '../../config.dart';
import '../../main.dart';

const apiKey = 'EEC8C305-A172-4709-8EE0-9F8239BF7CE7';

class CoinApi {
  final SocketService socketService = injector.get<SocketService>();
  final dio = injector.get<Dio>();

  Future<CoinbaseResponse> getCoins(String currencySelected) async {
    String url = config.baseUrl + 'v1/exchangerate/USD/UAH';
    final Response response = await dio.get(url);
    print('data $response');

    // return response.data.map<CoinbaseResponse>((dynamic e) {
    //   return CoinbaseResponse.fromJson(e);
    // });
    return CoinbaseResponse(
        response.data['time'],
        response.data['asset_id_base'],
        response.data['asset_id_quote'],
        response.data['src_side_quote'].map<SrcSideBase>((dynamic e) {
          return SrcSideBase.fromJson(e);
        }).toList());
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

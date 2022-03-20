import 'package:coin_test/data/services/socket_service.dart';
import 'package:coin_test/models/coinbase_response_model.dart';
import 'package:coin_test/models/srcsidebase_model.dart';
import 'package:dio/dio.dart';

import '../../config.dart';
import '../../main.dart';


class CoinApi {
  final SocketService socketService = injector.get<SocketService>();
  final dio = injector.get<Dio>();

  Future<CoinbaseResponse> getCoins(String currencySelected) async {
    var arr = currencySelected.split('/');
    String url = config.baseUrl + 'v1/exchangerate/${arr[1]}/${arr[0]}';
    final Response response = await dio.get(url);
    print('data $response');

    return CoinbaseResponse(
        response.data['time'],
        response.data['asset_id_base'],
        response.data['asset_id_quote'],
        response.data['src_side_quote'].map<SrcSideBase>((dynamic e) {
          return SrcSideBase.fromJson(e);
        }).toList());
  }

  String getCoinsWebsocket() {
    socketService.createCoinConnection(config.token);
    // socketService.coinSocket
    //     .on('unreadTokMessages', (dynamic coins) {
    //
    //
    // });
    return 'ii';
  }
}

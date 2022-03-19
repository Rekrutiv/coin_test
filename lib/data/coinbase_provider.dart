import 'dart:async';
import 'dart:convert';
import 'package:coin_test/models/coinbase_request_model.dart';
import 'package:coin_test/models/coinbase_response_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CoinbaseProvider {
  late final WebSocketChannel _btcWebsocket;

  CoinbaseProvider()
      : _btcWebsocket = WebSocketChannel.connect(
          Uri.parse('wss://ws.coinapi.io/v1/'),
      // wss://echo.websocket.events
        );

  Stream<dynamic> get bitcoinStream =>
      _btcWebsocket.stream;
          // .map<CoinbaseResponse>(
          // (value) => CoinbaseResponse.fromJson(jsonDecode(value)));

  void openBitcoin() {
    _btcWebsocket.sink.add(

        {
          "type": "hello",
          "apikey": "73034021-THIS-IS-SAMPLE-KEY",
          "heartbeat": false,
          "subscribe_data_type": ["trade"],
          "subscribe_filter_symbol_id": [
            "BITSTAMP_SPOT_BTC_USD\$",
            "BITFINEX_SPOT_BTC_LTC\$",
            "COINBASE_",
            "ITBIT_"
          ]
        }
      // jsonEncode(
      //   CoinbaseRequest(
      //     'hello',
      //     'EEC8C305-A172-4709-8EE0-9F8239BF7CE7',
      //     false,
      //     ["quote"],
      //     ["BTC/USD"],
      //   ).toJson(),
      // ),
    );
  }

  // void closeBitcoin() {
  //   _btcWebsocket.sink.close();
  // }
}

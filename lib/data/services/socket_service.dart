import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../config.dart';

class SocketService {
  late IO.Socket coinSocket;

  createCoinConnection(String accessToken) {
    coinSocket = IO.io(config.baseWeb, <String, dynamic>{
      'transports': ['websocket'],
      "query": {
        "token": accessToken,
      },
      "forceNew": true,
    });

    this.coinSocket.on("connect", (_) => print('Connected chat'));
    this.coinSocket.on("disconnect", (_) => print('Disconnected chat'));
  }






}

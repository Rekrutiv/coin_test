

import 'package:coin_test/data/services/currency.dart';
import 'package:coin_test/data/services/interceptor.dart';
import 'package:coin_test/data/services/socket_service.dart';
import 'package:dio/dio.dart';

import 'package:flutter_simple_dependency_injection/injector.dart';

class DependencyInjection {
  Injector initialise(Injector injector) {
    injector.map<Dio>((i) => Dio(), isSingleton: true);
    injector.map<HttpInterceptor>((i) => HttpInterceptor(), isSingleton: true);
    injector.map<SocketService>((i) => SocketService(), isSingleton: true);
    injector.map<CoinApi>((i) => CoinApi(), isSingleton: true);

    return injector;
  }
}

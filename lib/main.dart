import 'package:coin_test/presentation/bitcoin_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import 'data/services/dependency_injection.dart';
import 'data/services/interceptor.dart';





late Injector injector;
void main() {
  injector = Injector();
  DependencyInjection().initialise(injector);
  injector.get<HttpInterceptor>();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: BitCoin(),
    );
  }
}

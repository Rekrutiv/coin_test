

import 'package:coin_test/data/coinbase_provider.dart';
import 'package:coin_test/data/services/currency.dart';
import 'package:coin_test/presentation/coin_price.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class BitCoin extends StatefulWidget {

  @override
  _BitCoinState createState() => _BitCoinState();
}

class _BitCoinState extends State<BitCoin> {
  /// set the default currency
  String selectedCurrency = 'USD';
  Map<String, String> coinValues = {};
  bool isWaiting = false;
  final apiService = injector.get<CoinApi>();
  late final CoinbaseProvider provider;

  @override
  void initState() {
    super.initState();
    // getCurrenciesData();

  }

  getCurrenciesData() async {
    isWaiting = true;
    try {
      dynamic data = await apiService.getCoins(selectedCurrency);
      print(data);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: blue8,
      appBar: AppBar(title: Text('Crypto App'), actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => Mode()));
          },
        )
      ]),
      body: Column(
        children: [ Expanded(
          child: CoinValue(
          ),
          flex: 4,
        ),
          // Expanded(
          //   child: new FutureBuilder(
          //     future: fetchassetsData(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         var assets = snapshot.data;
          //         return new ListView.builder(
          //             itemCount: 1,
          //             itemBuilder: (context, index) {
          //               return new Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: <Widget>[
          //                     new Text(assets![index]["asset_id"].toString(),
          //                         style: new TextStyle(
          //                             fontWeight: FontWeight.bold)),
          //                     new Text(assets[index]["name"].toString(),
          //                         style: new TextStyle(
          //                             fontWeight: FontWeight.bold)),
          //                     new Text(assets[index]["price_usd"].toString(),
          //                         style: new TextStyle(
          //                             fontWeight: FontWeight.bold)),
          //                     new Divider()
          //                   ]);
          //             });
          //       } else if (snapshot.hasError) {
          //         return new Text("${snapshot.error}");
          //       }
          //
          //       // By default, show a loading spinner
          //       return new CircularProgressIndicator();
          //     },
          //   ),
          // ),
        ],
      ),
      // ],
      // ),
    );
  }


}

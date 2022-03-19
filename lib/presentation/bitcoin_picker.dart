import 'package:coin_test/data/coinbase_provider.dart';
import 'package:coin_test/data/services/currency.dart';
import 'package:coin_test/models/coinbase_response_model.dart';
import 'package:coin_test/presentation/coin_price.dart';
import 'package:coin_test/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';


import '../main.dart';

class BitCoin extends StatefulWidget {
  @override
  _BitCoinState createState() => _BitCoinState();
}

class _BitCoinState extends State<BitCoin> {
  String selectedCurrency = 'USD';
  final apiService = injector.get<CoinApi>();
  late final CoinbaseProvider provider;


  @override
  void initState() {
    super.initState();
    provider = CoinbaseProvider();
    // provider.openBitcoin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coin Test')),
      body: Column(
        children: [

          SingleChildScrollView(
            child: Container(
              height: 100.0,
              child: CoinValue(provider: provider,),
            ),
          ),
          Expanded(
            child: FutureBuilder<CoinbaseResponse>(
              future: apiService.getCoins(selectedCurrency),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var assets = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Expanded(
                              child: TextButton(
                                  child: Text(
                                    '${assets?.assetIdBase}/${assets
                                        ?.assetIdQuote ?? ''}',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,

                                  ),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all<
                                          EdgeInsets>(
                                          EdgeInsets.all(15)),
                                      foregroundColor: MaterialStateProperty
                                          .all<
                                          Color>(Colors.red),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(

                                              side: BorderSide(
                                                  color: Colors.red)
                                          )
                                      )
                                  ),
                                  onPressed: () => null
                              ),
                            ),

                            SizedBox(width: 30),

                            TextButton(
                                child: Text(
                                    "subscribe".toUpperCase(),
                                    style: TextStyle(fontSize: 14)
                                ),
                                style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsets>(EdgeInsets.all(15)),
                                    foregroundColor: MaterialStateProperty.all<
                                        Color>(Colors.red),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(

                                            side: BorderSide(color: Colors.red)
                                        )
                                    )
                                ),
                                onPressed: () => provider.openBitcoin()
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [
                                Text(
                                  'Symbol \n ${assets?.assetIdBase}/${assets
                                      ?.assetIdQuote}',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,

                                ),
                                Text(
                                  'Price \n ${assets?.srcSideBase!.first.rate
                                      ?.toStringAsFixed(4)}',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                Text('time',
                                  // 'Time \n ${DateFormat('MMMM d, y', 'en_US').format(DataTime.now())}',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.start,
                                ),


                              ],
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<
                                    EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor: MaterialStateProperty.all<
                                    Color>(Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            18.0),
                                        side: BorderSide(color: Colors.red)
                                    )
                                )
                            ),
                            onPressed: () => null
                        ),
                        // Expanded(
                        //   child: ListView.builder(
                        //       itemCount: assets.srcSideBase?.length ?? 0,
                        //       itemBuilder: (context, index) {
                        //         return new Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: <Widget>[
                        //               Text(assets.srcSideBase![index].rate
                        //                   .toString(),
                        //                   style: TextStyle(
                        //                       fontWeight: FontWeight.bold)),
                        //               Text(assets.srcSideBase![index].time
                        //                   .toString(),
                        //                   style: TextStyle(
                        //                       fontWeight: FontWeight.bold)),
                        //
                        //
                        //               Divider()
                        //             ]);
                        //       }),
                        // )
                        SizedBox(height: 30),

                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)
                          ),
                          padding: const EdgeInsets.all(14),

                          width: double.infinity,
                          height: 300,
                          child:
                          LineChartWidget(data: assets!.srcSideBase!,),


                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
      // ],
      // ),
    );
  }
}

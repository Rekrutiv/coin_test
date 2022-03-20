import 'package:coin_test/blocs/coin_bloc/coin_bloc.dart';
import 'package:coin_test/data/coinbase_provider.dart';
import 'package:coin_test/presentation/coin_price.dart';
import 'package:coin_test/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BitCoin extends StatefulWidget {
  @override
  _BitCoinState createState() => _BitCoinState();
}

class _BitCoinState extends State<BitCoin> {
  final CoinBloc _newsBloc = CoinBloc();
  late final CoinbaseProvider provider;

  @override
  void initState() {
    super.initState();
    _newsBloc.add(GetCoinList());
    provider = CoinbaseProvider();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _newsBloc,
      child: BlocListener<CoinBloc, CoinState>(listener: (context, state) {
        if (state is CoinError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
            ),
          );
        }
      }, child: BlocBuilder<CoinBloc, CoinState>(builder: (context, state) {
        if (state is CoinInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CoinLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CoinLoaded) {
          return Scaffold(
            appBar: AppBar(title: Text('Coin Test')),
            body: Column(
              children: [
                // SingleChildScrollView(
                //   child: Container(
                //     height: 100.0,
                //     child: CoinValue(provider: provider,),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextButton(
                                  child: Text(
                                    '${state.coinModel.assetIdBase}/${state.coinModel.assetIdQuote ?? ''}',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.start,
                                  ),
                                  style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.all(15)),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.red),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color: Colors.red)))),
                                  onPressed: () => null),
                            ),
                            SizedBox(width: 30),
                            TextButton(
                                child: Text("subscribe".toUpperCase(),
                                    style: TextStyle(fontSize: 14)),
                                style: ButtonStyle(
                                    padding:
                                        MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.all(15)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: Colors.red)))),
                                onPressed: () => provider.openBitcoin()),
                          ],
                        ),
                        SizedBox(height: 30),
                        TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Symbol \n ${state.coinModel.assetIdBase}/${state.coinModel.assetIdQuote}',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                Text(
                                  'Price \n ${state.coinModel.srcSideBase!.first.rate?.toStringAsFixed(4)}',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'time',
                                  // 'Time \n ${DateFormat('MMMM d, y', 'en_US').format(DataTime.now())}',
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.red)))),
                            onPressed: () => null),
                        Expanded(
                          child: ListView.builder(
                              itemCount:
                                  state.coinModel.srcSideBase?.length ?? 0,
                              itemBuilder: (context, index) {
                                return new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                          state.coinModel.srcSideBase![index]
                                              .rate
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          state.coinModel.srcSideBase![index]
                                              .time
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Divider()
                                    ]);
                              }),
                        ),
                        SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red)),
                          padding: const EdgeInsets.all(14),
                          width: double.infinity,
                          height: 300,
                          child: LineChartWidget(
                              data: state.coinModel.srcSideBase!),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else
          return Container();
      })),
    );
  }
}

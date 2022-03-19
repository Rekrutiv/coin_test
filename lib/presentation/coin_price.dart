import 'package:coin_test/data/coinbase_provider.dart';
import 'package:coin_test/models/coinbase_response_model.dart';
import 'package:flutter/material.dart';



class CoinValue extends StatefulWidget {
final    CoinbaseProvider provider;
  const CoinValue({
    Key? key,
    required this.provider
  }) : super(key: key);

  @override
  State<CoinValue> createState() => _CoinValueState();
}

class _CoinValueState extends State<CoinValue> {
  late final CoinbaseProvider provider;
  @override
  void initState() {
    super.initState();

    provider = CoinbaseProvider();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Watching Coins:",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CoinPrice(
                    color: Colors.orange,
                    stream: widget.provider,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CoinPrice extends StatelessWidget {
  final CoinbaseProvider stream;
  final Color color;

  const CoinPrice({
    required this.stream,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: StreamBuilder<dynamic>(
        stream: stream.bitcoinStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            stream.openBitcoin();

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.hasData) {
            return Center(
              child: Text(
                '${snapshot.data!.toString()}',
                style: TextStyle(
                  color: color,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(
              child: Text('{No more data}'),
            );
          }

          return const Center(
            child: Text('No data'),
          );
        },
      ),
    );
  }
}
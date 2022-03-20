part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();

  @override
  List<Object> get props => [];
}

class GetCoinList extends CoinEvent {

  final String coins;

  const GetCoinList({
    required this.coins,
  });

  @override
  List<Object> get props => [coins];

}

class CoinFetchEvent extends CoinEvent {
  final String coins;

  const CoinFetchEvent({
    required this.coins,
  });

  @override
  List<Object> get props => [coins];
}

class CoinRefreshEvent extends CoinEvent {
  final String coins;
  const CoinRefreshEvent({required this.coins});
  @override
  List<Object> get props => [coins];
}

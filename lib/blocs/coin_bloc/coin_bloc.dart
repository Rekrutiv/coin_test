import 'package:bloc/bloc.dart';
import 'package:coin_test/data/repository/api_repository.dart';
import 'package:coin_test/models/coinbase_response_model.dart';
import 'package:equatable/equatable.dart';


part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetCoinList>((event, emit) async {
      try {
        emit(CoinLoading());
        final mList = await _apiRepository.fetchCoin(event.coins);
        emit(CoinLoaded(mList));

      } on NetworkError {
        emit(CoinError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

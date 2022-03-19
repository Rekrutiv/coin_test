
class AppConfig {
  final String baseUrl;
  final String baseWeb;



  AppConfig({
    required this.baseUrl,
    required this.baseWeb

  });
}

final AppConfig config = new AppConfig(

 baseUrl: 'https://rest.coinapi.io/',
    baseWeb:'wss://ws.coinapi.io/v1/'
);

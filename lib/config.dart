class AppConfig {
  final String baseUrl;
  final String baseWeb;
  final String token;

  AppConfig(
      {required this.baseUrl, required this.baseWeb, required this.token});
}

final AppConfig config = new AppConfig(
    baseUrl: 'https://rest.coinapi.io/',
    baseWeb: 'wss://ws.coinapi.io/v1/',
    token: 'EEC8C305-A172-4709-8EE0-9F8239BF7CE7');

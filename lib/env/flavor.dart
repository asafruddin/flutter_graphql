import 'package:flutter_graphql_architecture/env/config.dart';

/// managing the network environment
/// managing environment name and environment base url
class FlavorSetting {
  FlavorSetting.development() {
    Config.getInstance(
        flavorName: 'development',
        baseUrl: 'https://rickandmortyapi.com/graphql');
  }

  FlavorSetting.staging() {
    Config.getInstance(
        flavorName: 'staging', baseUrl: 'https://rickandmortyapi.com/graphql');
  }

  FlavorSetting.production() {
    Config.getInstance(
        flavorName: 'production',
        baseUrl: 'https://rickandmortyapi.com/graphql');
  }
}

class Config {
  Config({this.baseUrl, this.flavorName});

  /// store the flavor or environment name
  final String? flavorName;

  /// store the base url
  final String? baseUrl;

  static Config? _instance;

  /// geting the instance of flavor name and api base url
  static Config getInstance({String? flavorName, String? baseUrl}) {
    if (_instance == null) {
      _instance = Config(flavorName: flavorName, baseUrl: baseUrl);
      return _instance!;
    }
    return _instance!;
  }
}

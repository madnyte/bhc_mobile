import 'dart:io';

class Config {
  static final baseUrl = String.fromEnvironment(
    'baseUrl',
    defaultValue: (Platform.isAndroid) ? '10.0.2.2:8090' : '127.0.0.1:8090',
  );
}

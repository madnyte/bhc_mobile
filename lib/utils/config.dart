class Config {
  static const baseUrl = String.fromEnvironment(
    'baseUrl',
    defaultValue: 'https://bhc-backend-damp-forest-976.fly.dev',
  );
}

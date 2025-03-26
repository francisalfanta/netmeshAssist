// lib/utils/provider_helper.dart

String getProviderName(String provider) {
  if (provider.toUpperCase().contains('PHILIPPINE LONG DISTANCE')) {
    return 'PLDT';
  } else if (provider.toUpperCase().contains('SMART')) {
    return 'Smart';
  } else if (provider.toUpperCase().contains('GLOBE')) {
    return 'Globe';
  } else {
    return provider.split(" ")[0];
  }
}

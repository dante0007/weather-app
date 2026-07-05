/// Curated top-five city names per ISO-3166-1 alpha-2 country for the Other Cities row.
///
/// A bundled population-ranked dataset filtered by country would be more dynamic;
/// this map keeps the exercise simple and is easy to extend.
abstract final class TopCitiesCatalog {
  static const List<String> globalFallback = [
    'New York',
    'London',
    'Tokyo',
    'Paris',
    'Sydney',
  ];

  static const Map<String, List<String>> byCountryCode = {
    'US': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix'],
    'GB': ['London', 'Birmingham', 'Manchester', 'Glasgow', 'Edinburgh'],
    'IN': ['Mumbai', 'Delhi', 'Bengaluru', 'Hyderabad', 'Ahmedabad'],
    'CA': ['Toronto', 'Montreal', 'Vancouver', 'Calgary', 'Ottawa'],
    'AU': ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide'],
    'DE': ['Berlin', 'Hamburg', 'Munich', 'Cologne', 'Frankfurt'],
    'FR': ['Paris', 'Marseille', 'Lyon', 'Toulouse', 'Nice'],
    'JP': ['Tokyo', 'Osaka', 'Nagoya', 'Sapporo', 'Fukuoka'],
    'BR': ['São Paulo', 'Rio de Janeiro', 'Brasília', 'Salvador', 'Fortaleza'],
    'MX': ['Mexico City', 'Guadalajara', 'Monterrey', 'Puebla', 'Tijuana'],
    'AE': ['Dubai', 'Abu Dhabi', 'Sharjah', 'Ajman', 'Al Ain'],
    'SG': ['Singapore', 'Jurong', 'Woodlands', 'Tampines', 'Bedok'],
  };

  static List<String> cityNamesFor(String countryCode) {
    final normalized = countryCode.toUpperCase();
    return byCountryCode[normalized] ?? globalFallback;
  }

  static bool isCuratedCountry(String countryCode) {
    return byCountryCode.containsKey(countryCode.toUpperCase());
  }
}

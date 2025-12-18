class ApiConstants {
  static const String baseUrl = 'https://msr-backend-tjja.onrender.com';
  static const String recommendEndpoint = '/recommend';

  // Helper to build full URL
  static Uri getRecommendationUri(String movieName) {
    return Uri.parse('$baseUrl$recommendEndpoint').replace(queryParameters: {
      'movie': movieName,
    });
  }
}

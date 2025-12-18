import '../entities/movie.dart';

abstract class RecommendationRepository {
  Future<List<Movie>> getRecommendations(String movieName);
}

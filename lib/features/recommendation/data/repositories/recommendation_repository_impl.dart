import '../../domain/entities/movie.dart';
import '../../domain/repositories/recommendation_repository.dart';
import '../datasources/recommendation_remote_data_source.dart';

class RecommendationRepositoryImpl implements RecommendationRepository {
  final RecommendationRemoteDataSource remoteDataSource;

  RecommendationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Movie>> getRecommendations(String movieName) async {
    // Here we can cache or handle offline mode if we had a local source.
    // For now, simple pass-through with type conversion (covariant).
    return await remoteDataSource.getRecommendations(movieName);
  }
}

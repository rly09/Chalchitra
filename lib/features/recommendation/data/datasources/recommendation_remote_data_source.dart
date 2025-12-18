import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/failures.dart';
import '../models/movie_model.dart';

abstract class RecommendationRemoteDataSource {
  Future<List<MovieModel>> getRecommendations(String movieName);
}

class RecommendationRemoteDataSourceImpl implements RecommendationRemoteDataSource {
  final http.Client client;

  RecommendationRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MovieModel>> getRecommendations(String movieName) async {
    final uri = ApiConstants.getRecommendationUri(movieName);
    
    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final List<dynamic> recommendations = jsonResponse['recommendations'] ?? [];
        
        if (recommendations.isEmpty) {
          throw const EmptyFailure();
        }

        return recommendations
            .map((json) => MovieModel.fromJson(json))
            .toList();
      } else {
        throw ServerFailure('Server error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is Failure) rethrow;
      throw const NetworkFailure();
    }
  }
}

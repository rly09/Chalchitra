import 'package:flutter/material.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/recommendation_repository.dart';

enum RecommendationStatus { initial, loading, success, error }

class RecommendationProvider with ChangeNotifier {
  final RecommendationRepository repository;

  RecommendationProvider({required this.repository});

  RecommendationStatus _status = RecommendationStatus.initial;
  List<Movie> _movies = [];
  Failure? _failure;

  RecommendationStatus get status => _status;
  List<Movie> get movies => _movies;
  Failure? get failure => _failure;

  Future<void> getRecommendations(String movieName) async {
    if (movieName.trim().isEmpty) return;

    _status = RecommendationStatus.loading;
    _failure = null;
    notifyListeners();

    try {
      _movies = await repository.getRecommendations(movieName);
      _status = RecommendationStatus.success;
    } catch (e) {
      _status = RecommendationStatus.error;
      _failure = e is Failure ? e : ServerFailure(e.toString());
    }

    notifyListeners();
  }
}

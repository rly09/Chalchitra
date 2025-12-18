import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/recommendation/data/datasources/recommendation_remote_data_source.dart';
import 'features/recommendation/data/repositories/recommendation_repository_impl.dart';
import 'features/recommendation/presentation/providers/recommendation_provider.dart';
import 'features/recommendation/presentation/pages/home_screen.dart';

void main() {
  runApp(const MsrApp());
}

class MsrApp extends StatelessWidget {
  const MsrApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    final client = http.Client();
    final remoteDataSource = RecommendationRemoteDataSourceImpl(client: client);
    final repository = RecommendationRepositoryImpl(remoteDataSource: remoteDataSource);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RecommendationProvider(repository: repository),
        ),
      ],
      child: MaterialApp(
        title: 'Chalchitra',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const HomeScreen(),
      ),
    );
  }
}

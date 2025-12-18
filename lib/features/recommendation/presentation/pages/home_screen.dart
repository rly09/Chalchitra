import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/recommendation_provider.dart';
import '../widgets/form_widgets.dart';
import '../widgets/recommendation_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  void _onSearch() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      FocusScope.of(context).unfocus();
      context.read<RecommendationProvider>().getRecommendations(query);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient Background applied to the whole Scaffold body
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      // Header
                      Row(
                        children: [
                          Icon(Icons.movie_filter_rounded, 
                            color: Theme.of(context).colorScheme.primary, size: 36)
                            .animate().scale(duration: 500.ms, curve: Curves.easeOutBack),
                          const SizedBox(width: 12),
                          Text(
                            'Chalchitra',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2, end: 0),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Discover your next favorite.',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
                      
                      const SizedBox(height: 56),

                      // Search Section
                      Text(
                        'Search Movie',
                         style: Theme.of(context).textTheme.titleSmall?.copyWith(letterSpacing: 1.1),
                      ).animate().fadeIn(delay: 350.ms),
                      const SizedBox(height: 12),
                      SearchInput(
                        controller: _searchController,
                        onSubmitted: _onSearch,
                      ).animate().fadeIn(delay: 400.ms).moveY(begin: 20, end: 0),
                      
                      const SizedBox(height: 32),

                      Consumer<RecommendationProvider>(
                        builder: (context, provider, child) {
                          return PrimaryButton(
                            onPressed: _onSearch,
                            isLoading: provider.status == RecommendationStatus.loading,
                          );
                        },
                      ).animate().fadeIn(delay: 500.ms).moveY(begin: 20, end: 0),

                      const SizedBox(height: 56),

                      // Results Section
                      Consumer<RecommendationProvider>(
                        builder: (context, provider, child) {
                          if (provider.status == RecommendationStatus.loading) {
                             // Loading handled by button, but we can show something subtle here if needed
                             return const SizedBox.shrink();
                          }

                          if (provider.status == RecommendationStatus.error) {
                            return Center(
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.white10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.error_outline, size: 48, color: Theme.of(context).colorScheme.error),
                                    const SizedBox(height: 16),
                                    Text(
                                      provider.failure?.message ?? 'Something went wrong.',
                                      style: const TextStyle(color: Colors.white70),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ).animate().fadeIn().scale();
                          }

                          if (provider.status == RecommendationStatus.success) {
                            if (provider.movies.isEmpty) {
                              return const Center(
                                child: Text('No recommendations found.', style: TextStyle(color: Colors.white54)),
                              ).animate().fadeIn();
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Recommended for you',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ).animate().fadeIn(),
                                const SizedBox(height: 24),
                                SizedBox(
                                  height: 280, // Fixed height for horizontal list
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    clipBehavior: Clip.none, // Allow shadows to bleed
                                    itemCount: provider.movies.length,
                                    itemBuilder: (context, index) {
                                      return RecommendationCard(
                                        movie: provider.movies[index],
                                      ).animate(delay: (100 * index).ms)
                                       .fadeIn(duration: 400.ms)
                                       .slideX(begin: 0.2, end: 0, curve: Curves.easeOutQuad);
                                    },
                                  ),
                                ),
                              ],
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

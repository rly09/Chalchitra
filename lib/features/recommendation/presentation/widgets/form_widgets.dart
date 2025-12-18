import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;

  const SearchInput({
    super.key,
    required this.controller,
    required this.onSubmitted,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          setState(() => _isFocused = focus);
        },
        child: AnimatedContainer(
          duration: 200.ms,
          decoration: BoxDecoration(
            color: _isFocused 
                ? Theme.of(context).inputDecorationTheme.fillColor!.withValues(alpha: 0.8)
                : Theme.of(context).inputDecorationTheme.fillColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isFocused 
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.5) 
                  : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _isFocused ? 0.4 : 0.2),
                blurRadius: _isFocused ? 16 : 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: widget.controller,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textInputAction: TextInputAction.search,
            onSubmitted: (_) {
               HapticFeedback.lightImpact();
               widget.onSubmitted();
            },
            decoration: InputDecoration(
              hintText: 'Search for a movie...',
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(14),
                child: Icon(
                  Icons.search,
                  color: _isFocused ? Colors.white : Colors.white54,
                ),
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isLoading;
  final String label;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
    this.label = 'Recommend',
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryRed.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: widget.isLoading ? null : () {
            HapticFeedback.mediumImpact();
            widget.onPressed();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryRed,
            foregroundColor: Colors.white,
            disabledBackgroundColor: AppTheme.primaryRed.withValues(alpha: 0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0, // Handled by Container
          ),
          child: widget.isLoading
              ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: Colors.white,
                  ),
                )
              : Text(
                  widget.label.toUpperCase(),
                  style: const TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}

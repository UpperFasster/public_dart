import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final Widget child;
  const LoadingPage({
    super.key,
    required this.isLoading,
    this.errorMessage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.redAccent,
          ),
        ),
      );
    }
    return child;
  }
}

import 'package:flutter/material.dart';

class CoursesFailureView extends StatelessWidget {
  final String message;
  const CoursesFailureView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

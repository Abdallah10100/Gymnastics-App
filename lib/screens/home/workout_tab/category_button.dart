import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final String imageAsset;
  final int numberOfExercises;
  final Duration totalDuration;
  final VoidCallback? onPressed;
  final Color color;

  const CategoryButton(
      {required this.categoryName,
      required this.numberOfExercises,
      required this.totalDuration,
      required this.imageAsset,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(14),
        height: MediaQuery.of(context).size.height * 0.16,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryName,
                      style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Exercises: $numberOfExercises',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Duration: ${totalDuration.inMinutes} mins',
                      // Display duration in minutes
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12)),
                  child: Image.asset(
                    imageAsset,
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

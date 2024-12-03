import 'package:flexi/src/config/config.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final Color color;
  final double cardHeight;
  final double cardWidth;
  final double cardRadius;
  final double progress;
  final String title;
  final double progressSize; // Neue Variable für die Größe des Kreises

  const ProgressCard({
    super.key,
    this.color = Colors.grey,
    this.cardHeight = 220,
    this.cardWidth = 220,
    this.cardRadius = 10,
    required this.progress, // Fortschrittswert als Parameter
    this.title = 'Fortschritt',
    this.progressSize = 100, // Standardgröße des CircularProgressIndicator
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: padding),
            // Stack für CircularProgressIndicator und Text
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: progressSize, // Setze die Größe des Kreises
                  width: progressSize, // Setze die Größe des Kreises
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: progress,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: const Color.fromARGB(255, 113, 113, 113), // Hintergrundfarbe des Kreises
                  ),
                ),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%', // Zeigt den Prozentsatz an
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: padding),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

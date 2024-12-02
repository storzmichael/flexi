import 'package:flexi/src/config/config.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/category_card.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/challenge_card.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/progress_card.dart';
import 'package:flexi/src/features/dashboard/presentation/widgets/task_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          // Platzhalter
          const SizedBox(
            height: 250,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryCard(
                color: Colors.red,
              ),
              CategoryCard(
                color: Colors.green,
              ),
              CategoryCard(
                color: Colors.blue,
              ),
              CategoryCard(
                color: Colors.purple,
              ),
            ],
          ),
          SizedBox(height: padding),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProgressCard(
                color: Colors.red,
              ),
              ProgressCard(
                color: Colors.green,
              ),
              ProgressCard(
                color: Colors.blue,
              ),
              ProgressCard(
                color: Colors.purple,
              ),
            ],
          ),
          SizedBox(height: padding),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TaskCard(
                color: Colors.red,
              ),
              TaskCard(
                color: Colors.green,
              ),
              TaskCard(
                color: Colors.blue,
              ),
              TaskCard(
                color: Colors.purple,
              ),
            ],
          ),
          SizedBox(height: padding),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ChallengeCard(
                color: Colors.red,
              ),
              ChallengeCard(
                color: Colors.green,
              ),
              ChallengeCard(
                color: Colors.blue,
              ),
              ChallengeCard(
                color: Colors.purple,
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/workout_tab/workout_category.dart';

class WorkoutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(183, 147, 254, 100),
          title: const Text(
            'Gymnastics Workouts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: WorkoutCategoryScreen(),
      );
}

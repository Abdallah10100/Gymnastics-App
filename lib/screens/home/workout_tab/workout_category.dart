import 'package:flutter/material.dart';

import '../../../core/const/color_constants.dart';
import '../../../model/exercise.dart';
import 'category_button.dart';
import 'exercise_screen.dart';

class WorkoutCategoryScreen extends StatefulWidget {
  @override
  State<WorkoutCategoryScreen> createState() => _WorkoutCategoryScreenState();
}

class _WorkoutCategoryScreenState extends State<WorkoutCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topRight,
                colors: [
              ColorConstants.white,
              ColorConstants.disabledColor,
              Color.fromRGBO(183, 147, 254, 100),
            ])),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CategoryButton(
                categoryName: 'Cardio Workout',
                imageAsset: 'assets/workout1.png',
                onPressed: () {
                  navigateToExerciseScreen(context, 'Cardio Exercises');
                },
                color: ColorConstants.cardioColor.withOpacity(.7),
                numberOfExercises: 5,
                totalDuration: Duration(minutes: 50),
              ),
              SizedBox(height: 10),
              CategoryButton(
                categoryName: 'Stretching Workout',
                imageAsset: 'assets/workout2.png',
                onPressed: () =>
                    navigateToExerciseScreen(context, 'Stretching Exercises'),
                color: Colors.pink.shade100.withOpacity(0.9),
                numberOfExercises: 7,
                totalDuration: Duration(minutes: 30),
              ),
              SizedBox(height: 10),
              CategoryButton(
                categoryName: 'Abs Workout',
                imageAsset: 'assets/workout3.png',
                onPressed: () =>
                    navigateToExerciseScreen(context, 'Abs Exercises'),
                color: Colors.green.shade100.withOpacity(0.8),
                numberOfExercises: 4,
                totalDuration: Duration(minutes: 25),
              ),
              SizedBox(height: 16),
              CategoryButton(
                  categoryName: 'Arms Workout',
                  imageAsset: 'assets/yoga.png',
                  onPressed: () =>
                      navigateToExerciseScreen(context, 'Arm Exercises'),
                  numberOfExercises: 5,
                  totalDuration: Duration(minutes: 35),
                  color: Colors.purple.shade100),
              SizedBox(height: 10),
              CategoryButton(
                categoryName: 'Chest Workout',
                imageAsset: 'assets/pushup.png',
                onPressed: () =>
                    navigateToExerciseScreen(context, 'Chest Exercises'),
                color: Colors.orange.shade100.withOpacity(0.9),
                numberOfExercises: 4,
                totalDuration: Duration(minutes: 20),
              ),
              // Add more categories as needed
            ],
          ),
        ),
      ),
    );
  }
}

void navigateToExerciseScreen(BuildContext context, String category) {
  List<Exercise> exercises = [];
  if (category == 'Cardio Exercises') {
    exercises = [
      Exercise(
        name: '1-Ghost rope',
        videoUrl: 'assets/videos/Ghostrope.mp4',
        noOfReps: 20,
        duration: Duration(seconds: 240),
      ),
      Exercise(
        name: '2-in&out+ knee to elbow',
        videoUrl: 'assets/videos/in&out+kneetoelbow.mp4',
        noOfReps: 15,
        duration: Duration(seconds: 240),
      ),
      Exercise(
        name: '3-jumping jacks',
        videoUrl: 'assets/videos/jumpingjacks.mp4',
        noOfReps: 10,
        duration: Duration(seconds: 140),
      ),
      Exercise(
        name: '4-scissor jumps',
        videoUrl: 'assets/videos/scissorjumps.mp4',
        noOfReps: 15,
        duration: Duration(seconds: 140),
      ),
      Exercise(
        name: '5-high knees',
        videoUrl: 'assets/videos/highkness.mp4',
        noOfReps: 30,
        duration: Duration(seconds: 240),
      ),
    ];
  } else if (category == 'Stretching Exercises') {
    exercises = [
      Exercise(
        name: 'Exercise 1',
        videoUrl: 'assets/videos/armsFirst.mp4',
        noOfReps: 15,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 2',
        videoUrl: 'assets/videos/armsSecond.mp4',
        noOfReps: 20,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 3',
        videoUrl: 'assets/videos/armsThird.mp4',
        noOfReps: 10,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 4',
        videoUrl: 'assets/videos/burpees.mp4',
        noOfReps: 30,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 5',
        videoUrl: 'assets/videos/yoga.mp4',
        noOfReps: 10,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 6',
        videoUrl: 'assets/videos/yoga2.mp4',
        noOfReps: 15,
        duration: Duration(seconds: 40),
      ),
    ];
  } else if (category == 'Abs Exercises') {
    exercises = [
      Exercise(
        name: '1-AltPlankKneeTuck',
        videoUrl: 'assets/videos/AltPlankKneeTuck.mp4',
        noOfReps: 15,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: '2-Crunch pause',
        videoUrl: 'assets/videos/Crunchpause.mp4',
        noOfReps: 20,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: '3-Reverse Crunch',
        videoUrl: 'assets/videos/ReverseCrunch.mp4',
        noOfReps: 30,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: '4-Leg lift + Hip lift',
        videoUrl: 'assets/videos/Leglift+Hiplift.mp4',
        noOfReps: 25,
        duration: Duration(seconds: 40),
      ),
    ];
  } else if (category == 'Arm Exercises') {
    exercises = [
      Exercise(
        name: 'Exercise 1',
        videoUrl: 'assets/videos/armsFirst.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 2',
        videoUrl: 'assets/videos/armsSecond.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 3',
        videoUrl: 'assets/videos/armsThird.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 4',
        videoUrl: 'assets/videos/burpees.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 5',
        videoUrl: 'assets/videos/yoga.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 6',
        videoUrl: 'assets/videos/yoga2.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
    ];
  } else if (category == 'Chest Exercises') {
    exercises = [
      Exercise(
        name: 'Exercise 1',
        videoUrl: 'assets/videos/armsFirst.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 2',
        videoUrl: 'assets/videos/armsSecond.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 3',
        videoUrl: 'assets/videos/armsThird.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 4',
        videoUrl: 'assets/videos/burpees.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 5',
        videoUrl: 'assets/videos/yoga.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
      Exercise(
        name: 'Exercise 6',
        videoUrl: 'assets/videos/yoga2.mp4',
        noOfReps: 5,
        duration: Duration(seconds: 40),
      ),
    ];
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          ExerciseScreen(category: category, exercises: exercises),
    ),
  );
}

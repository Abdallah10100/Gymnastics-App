import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/workout_tab/video_player_screen.dart';

import '../../../core/const/color_constants.dart';
import '../../../model/exercise.dart';

class ExerciseScreen extends StatefulWidget {
  final String category;
  final List<Exercise> exercises;

  ExerciseScreen({required this.category, required this.exercises});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  bool _workoutRecorded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(183, 147, 254, 100),
        title: Text(widget.category,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
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
        child: ListView.builder(
          itemCount: widget.exercises.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (!_workoutRecorded) {
                  _recordWorkout(widget.category, widget.exercises);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(
                      videoPath: widget.exercises[index].videoUrl,
                      exerciseTitle: widget.exercises[index].name,
                      numberOfRepetitions: widget.exercises[index].noOfReps,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .11,
                  child: Center(
                    child: ListTile(
                      title: Text(
                        widget.exercises[index].name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(Icons.play_circle_filled, size: 50),
                      trailing: Icon(
                        Icons.arrow_forward,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _recordWorkout(String category, List<Exercise> exercises) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get current timestamp
      DateTime now = DateTime.now();
      Duration totalDuration = exercises.fold(Duration.zero,
          (previousValue, element) => previousValue + element.duration);

      // Check if a workout with the same category and timestamp exists
      QuerySnapshot<Map<String, dynamic>> existingWorkouts =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('workouts')
              .where('WorkoutName', isEqualTo: category)
              .get();

      if (existingWorkouts.docs.isNotEmpty) {
        // Workout with the same category and timestamp already exists
        print('Workout already recorded');
        return; // Exit function to avoid recording duplicate workout
      }

      // Calculate number of exercises
      int numberOfExercises = exercises.length;

      // Record workout details in Firestore
      DocumentReference workoutRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('workouts')
          .add({
        'WorkoutName': category,
        'timestamp': now,
        'numberOfExercises': numberOfExercises,
        'totalDurationInMinutes': totalDuration.inMinutes
      });

      // Record details of each exercise in the workout
      for (Exercise exercise in exercises) {
        await workoutRef.collection('exercises').add({
          'ExerciseName': exercise.name,
          'videoUrl': exercise.videoUrl,
          'durationInSeconds': exercise.duration.inSeconds,
          // Store duration in milliseconds
          'timestamp': now,
        });
      }

      print('Workout recorded successfully');
    } else {
      print('User not signed in');
    }
  }
}

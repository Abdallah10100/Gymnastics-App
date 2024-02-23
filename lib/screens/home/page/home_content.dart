import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/home/workout_tab/workout_tab.dart';

import '../../../core/const/color_constants.dart';
import '../../../core/const/data_constants.dart';
import '../../../core/const/path_constants.dart';
import '../../../core/const/text_constants.dart';
import '../../../core/providers/auth_provider.dart';
import 'home_exercises_card.dart';

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          _createProfileData(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          _createExercisesList(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          // SamplePlayer(),
          SizedBox(
            height: MediaQuery.of(context).size.height * .24,
          ),
          _createProgress(),
        ],
      ),
    );
  }

  Widget _createProfileData(BuildContext context) {
    var authProvider = Provider.of<UserAuthProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${authProvider.currentUser!.name ?? "No user name"}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                TextConstants.checkActivity,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.asset(
                    PathConstants.profile,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createExercisesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            TextConstants.discoverWorkouts,
            style: TextStyle(
              color: ColorConstants.textBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              WorkoutCard(
                  color: ColorConstants.cardioColor,
                  workout: DataConstants.homeWorkouts[0],
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => WorkoutTab()))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: ColorConstants.armsColor,
                  workout: DataConstants.homeWorkouts[1],
                  onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => WorkoutTab()))),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createProgress() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.textBlack.withOpacity(0.12),
            blurRadius: 5.0,
            spreadRadius: 1.1,
          ),
        ],
      ),
      child: const Row(
        children: [
          Image(
            image: AssetImage(
              PathConstants.progress,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextConstants.keepProgress,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  TextConstants.profileSuccessful,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

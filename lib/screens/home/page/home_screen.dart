import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/const/color_constants.dart';
import 'package:todo_app/core/const/path_constants.dart';
import 'package:todo_app/screens/home/center_tab/center_tab.dart';
import 'package:todo_app/screens/home/page/home_content.dart';
import 'package:todo_app/screens/home/profile_tab/profile_tab.dart';
import 'package:todo_app/screens/home/workout_tab/workout_tab.dart';

import '../../../core/providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> tabs = [HomeContent(), WorkoutTab(), CenterTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<UserAuthProvider>(context);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
              colors: [
            ColorConstants.white,
            ColorConstants.disabledColor,
            Color.fromRGBO(183, 147, 254, 100),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
            iconSize: 30,
            elevation: 0.0,
            unselectedItemColor: Colors.white,
            selectedItemColor: ColorConstants.cardioColor,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathConstants.home)),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathConstants.workouts)),
                  label: 'Workout'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathConstants.center)),
                  label: 'Center'),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathConstants.profileIcon)),
                  label: 'Profile'),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/providers/auth_provider.dart';
import 'package:todo_app/screens/forgot_password/page/forgot_password_screen.dart';
import 'package:todo_app/screens/home/center_tab/artistic_page.dart';
import 'package:todo_app/screens/home/center_tab/center_details.dart';
import 'package:todo_app/screens/home/center_tab/instructors_content.dart';
import 'package:todo_app/screens/home/page/home_screen.dart';
import 'package:todo_app/screens/home/profile_tab/change_password.dart';
import 'package:todo_app/screens/home/profile_tab/edit_account.dart';
import 'package:todo_app/screens/home/profile_tab/profile_content.dart';
import 'package:todo_app/screens/login/page/login_screen.dart';
import 'package:todo_app/screens/onboarding/onboarding.dart';
import 'package:todo_app/screens/sign_up/page/sign_up_screen.dart';
import 'package:todo_app/screens/splash/splasch_screen.dart';

import 'core/const/color_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserAuthProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gymnastics',
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyLarge: TextStyle(color: ColorConstants.textColor)),
        fontFamily: 'NotoSansKR',
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        Onboarding.routeName: (context) => Onboarding(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        ForgotPassword.routeName: (context) => ForgotPassword(),
        HomeScreen.routeName: (context) => HomeScreen(),
        Instructors.routeName: (context) => Instructors(),
        CentersDetail.routeName: (context) => CentersDetail(),
        Artistic.routeName: (context) => Artistic(),
        ProfileContent.routeName: (context) => ProfileContent(),
        EditAccount.routeName: (context) => EditAccount(),
        ChangePassword.routeName: (context) => ChangePassword(),
      },
    );
  }
}

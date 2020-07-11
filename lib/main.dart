import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wedding_planner/Services/auth.dart';
import 'package:wedding_planner/screens/category_list_screen.dart';
import 'package:wedding_planner/Packages/package1.dart';
import 'package:wedding_planner/screens/wrapper.dart';
import './Packages/package2.dart';
import './Packages/package3.dart';
import 'screens/contact_screen.dart';
import 'screens/gender_screen.dart';
import 'screens/todo_screen.dart';
import 'Services/sign_In_screen.dart';
import 'widgets/drawer_item.dart';
import 'Services/sign_up_screen.dart';
import 'screens/setting_screen.dart';
import 'screens/login&register_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/wedding_budget_screen.dart';
import 'screens/wedding_day_screen.dart';
import 'screens/home_screen.dart';
import 'screens/budget_list.dart';
import './constants.dart';
import './model/data_info.dart';
import './model/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class MyApp extends StatefulWidget {
  static const id = '/';
  final Gender selectedGender;
  MyApp({
    this.selectedGender,
  });

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'home page',
        theme: ThemeData(
          primaryColor: widget.selectedGender == Gender.female
              ? kBackGroundGirlColor
              : kBackGroundMaleColor,
          accentColor: widget.selectedGender == Gender.female
              ? kBorderColorF
              : kBorderColorM,
          backgroundColor: widget.selectedGender == Gender.female
              ? kBackGroundGirlColor
              : kBackGroundMaleColor,
          scaffoldBackgroundColor: widget.selectedGender == Gender.female
              ? kBackGroundGirlColor
              : kBackGroundMaleColor,
          //.... text_theme.....
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'Christmas',
              color: widget.selectedGender == Gender.female
                  ? kTextColorF
                  : kTextColorM,
            ),
            body1: TextStyle(
              fontFamily: 'Montserrat',
              color: widget.selectedGender == Gender.female
                  ? kActiveCardColorM
                  : Colors.white,
            ),
          ),
        ),
        home: Wrapper(),
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          WeddingDay.id: (context) => WeddingDay(),
          WeddingBudget.id: (context) => WeddingBudget(),
          LoginScreen.id: (context) => LoginScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          MyHomeScreen.id: (context) => MyHomeScreen(),
          SideMenu.id: (context) => SideMenu(),
          CategoryList.id: (context) => CategoryList(),
          Package1.id: (context) => Package1(),
          Package2.id: (context) => Package2(),
          Package3.id: (context) => Package3(),
          BudgetList.id: (context) => BudgetList(),
          TodoScreen.id: (context) => TodoScreen(),
          ContactScreen.id: (context) => ContactScreen(),
          SettingScreen.id: (context) => SettingScreen(),
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => MyHomeScreen());
        },
      ),
    );
  }
}

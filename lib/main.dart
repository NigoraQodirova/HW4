import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart';
import 'home_screen.dart';
import 'user_list_screen1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool showTutorial =
      prefs.getBool('showTutorial') ?? true; // Default to true if not set

  runApp(MyApp(showTutorial: showTutorial));
}

class MyApp extends StatelessWidget {
  final bool showTutorial;

  const MyApp({super.key, required this.showTutorial});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: showTutorial ? const WelcomeScreen() : const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/user_list1': (context) => const UserListScreen(),
        // '/user_list2': (context) => const Screen2(),
      },
    );
  }
}

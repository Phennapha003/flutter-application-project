import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/Screens/home_screen.dart';

import 'package:flutter_application_project/firebase_options.dart';
import 'Screens/main_screen.dart';
import 'Screens/registry_screen.dart';
import 'Screens/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 229, 250),
      ),
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => const MainScreen(),
        RegistryScreen.id: (context) => const RegistryScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}

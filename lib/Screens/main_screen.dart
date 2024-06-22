import 'package:flutter/material.dart';

import '../components/navigation_button.dart';
import 'registry_screen.dart';
import 'sign_in_screen.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main_screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);
    animationColor = ColorTween(begin: Colors.white, end: Colors.pink)
        .animate(animationController);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: SizedBox(
              height: animation.value * 60,
              child: Image.asset('assets/images/balanced-diet.png'),
            ),
          ),
          const Center(
            child: Text(
              'Food Recipe',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 255, 101, 173),
              ),
            ),
          ),
          const NavigationButton(
            label: 'Sign-in',
            routeName: SignInScreen.id,
          ),
          const NavigationButton(
            label: 'Create an account',
            routeName: RegistryScreen.id,
          ),
        ],
      ),
    );
  }
}

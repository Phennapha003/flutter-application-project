// ignore_for_file: prefer_final_fields, unused_field

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/Screens/home_screen.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import '../components/input_with_error_text.dart';
import '../components/my_button.dart';
import '../components/my_text_input_with_error_text.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'sign_in_screen';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  InputWithErrorText _email = InputWithErrorText();
  InputWithErrorText _password = InputWithErrorText();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 101, 173),
        title: const Text(
          'Sign In',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: ProgressHUD(
        child: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Hero(
                        tag: 'Logo',
                        child: Image.asset('assets/images/balanced-diet.png'),
                      ),
                    ),
                  ),
                  const Text(
                    'Sign-in',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 83, 83, 83),
                    ),
                  ),
                ],
              ),
              MyTextInputWithErrorText(
                input: _email,
                hintText: 'enter Email',
                keyboardType: TextInputType.emailAddress,
              ),
              MyTextInputWithErrorText(
                input: _password,
                hintText: 'enter password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              MyButton(
                label: 'Next',
                onPressed: () async {
                  final progress = ProgressHUD.of(context);
                  progress?.showWithText('Loading...');
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email.valueText, password: _password.valueText);

                    if (!mounted) return;
                    Navigator.pushNamed(context, HomeScreen.id);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      _email.errorText = 'user not found';
                    }
                    if (e.code == 'wrong-password') {
                      _password.errorText = 'wrong password';
                    }
                    log(e.toString());
                  }
                  setState(() {});
                  progress?.dismiss();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: sort_child_properties_last, unused_field, unused_local_variable, use_build_context_synchronously, unused_element, non_constant_identifier_names

import 'dart:developer';
import 'dart:io';
import 'package:flutter_application_project/Screens/home_screen.dart';
import 'package:flutter_application_project/components/my_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../components/my_text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistryScreen extends StatefulWidget {
  static const id = 'registry_screen';
  const RegistryScreen({super.key});

  @override
  State<RegistryScreen> createState() => _RegistryScreenState();
}

class _RegistryScreenState extends State<RegistryScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String username;

  late File _avatar;
  void _pickedImageFile({required File pickedImageFile}) {
    _avatar = pickedImageFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 101, 173),
        title: const Text(
          'Registry',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
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
                'Create a new account',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 83, 83, 83),
                ),
              )
            ],
          ),
          MyTextInput(
            hintText: 'Enter your username',
            keyboardType: TextInputType.text,
            onChanged: (value) {
              username = value;
            },
          ),
          MyTextInput(
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              email = value;
            },
          ),
          MyTextInput(
            hintText: 'Enter your password',
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {
              password = value;
            },
          ),
          MyButton(
            label: 'Next',
            onPressed: () async {
              try {
                UserCredential userCredential =
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                if (userCredential.user != null) {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(email)
                      .set({
                    'username': username,
                    'uid': userCredential.user!.uid,
                  });
                  if (!mounted) return;
                  Navigator.pushNamed(context, HomeScreen.id);
                }
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  log('The password provided is too weak.');
                } else if (e.code == 'email=already-in-use') {
                  log('The account already exists for that email.');
                } else {
                  log(e.toString());
                }
              } catch (e) {
                log(e.toString());
              }
            },
          ),
        ],
      ),
    );
  }
}

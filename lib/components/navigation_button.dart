// ignore_for_file: use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

class NavigationButton extends StatelessWidget {
  final String label;
  final String routeName;

  final Function()? onPressed;
  const NavigationButton(
      {super.key,
      required this.label,
      this.onPressed,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () async {
            try {
              await audioPlayer.play(
                AssetSource('sounds/mouse-click-153941.mp3'),
              );
              Navigator.pushNamed(context, routeName);
            } catch (e) {
              dev.log('$e');
            }
          },
          // onPressed: () => Navigator.pushNamed(context, routeName),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 255, 101, 173),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

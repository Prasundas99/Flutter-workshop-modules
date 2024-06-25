import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  String _imageAssets = 'assets/dice-1.png';

  void _rollDice() {
    final random = Random();
    final diceRoll = random.nextInt(6) + 1; // Generates a number between 1 and 6
    setState(() {
      _imageAssets = 'assets/dice-$diceRoll.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          _imageAssets,
          width: 200.0,
        ),
        const SizedBox(height: 20.0), // Add space between the image and the button
        TextButton(
          onPressed: _rollDice,
          child: const Text(
            "Roll Dice",
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          ),
        ),
      ],
    );
  }
}

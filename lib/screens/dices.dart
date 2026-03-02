import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_widgets/dice_button.dart';

class DiceScreen
    extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() =>
      _DiceScreenState();
}

class _DiceScreenState
    extends State<DiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Adventurer's Backpack",
        ),
        centerTitle: true,
        backgroundColor:
            Colors.amber[300],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        children: [
          DiceButton(diceSide: 20),
          DiceButton(diceSide: 12),
          DiceButton(diceSide: 10),
          DiceButton(diceSide: 8),
          DiceButton(diceSide: 6),
          DiceButton(diceSide: 4),
        ],
      ),
    );
  }
}

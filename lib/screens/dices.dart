import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_widgets/dice_button.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
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
          style: TextStyle(color: Colors.white),
        ),

        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.77,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        padding: EdgeInsets.all(10),
        children: [
          DiceButton(diceSide: 20, colorName: Colors.red[400]),
          DiceButton(diceSide: 12, colorName: Colors.red[400]),
          DiceButton(diceSide: 10, colorName: Colors.red[400]),
          DiceButton(diceSide: 8, colorName: Colors.red[400]),
          DiceButton(diceSide: 6, colorName: Colors.red[400]),
          DiceButton(diceSide: 4, colorName: Colors.red[400]),
        ],
      ),
      backgroundColor: Colors.purple[900],
    );
  }
}

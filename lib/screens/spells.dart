import 'package:flutter/material.dart';

class SpellScreen extends StatefulWidget {
  const SpellScreen({super.key});

  @override
  State<SpellScreen> createState() => _SpellScreenState();
}

class _SpellScreenState extends State<SpellScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Adventurer's Backpack"),
        centerTitle: true,
        backgroundColor: Colors.yellow[400],
      ),
    );
  }
}

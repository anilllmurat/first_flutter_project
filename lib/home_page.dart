import 'package:flutter/material.dart';
import 'screens/dices.dart';
import 'screens/notes.dart';
import 'screens/spells.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Adventurer's Backpack",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple[900],
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.90,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(10),

          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SpellScreen()),
                );
              },

              color: Colors.red[400],

              child: Text(
                "Spells",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoteScreen()),
                );
              },
              color: Colors.red[400],
              child: Text(
                "Notes",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DiceScreen()),
                );
              },
              color: Colors.red[400],
              child: Text(
                "Dices",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}

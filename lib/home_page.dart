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
          ),
          backgroundColor:
              Colors.amber[300],
          centerTitle: true,
        ),
        body: GridView.count(
          crossAxisCount: 2,

          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const SpellScreen(),
                  ),
                );
              },
              color: Colors.blue[700],

              child: Text(
                "Spells",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const NoteScreen(),
                  ),
                );
              },
              color: Colors.amber,
              child: Text(
                "Notes",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DiceScreen(),
                  ),
                );
              },
              color: Colors.green[500],
              child: Text(
                "Dices",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

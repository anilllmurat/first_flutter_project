//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'screens/note_screen.dart';

void main() {
  runApp(Uygulama());
}

class Uygulama extends StatelessWidget {
  const Uygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Splash_screen(),
      home: NoteScreen(),
    );
  }
}

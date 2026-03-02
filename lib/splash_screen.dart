import 'package:flutter/material.dart';
import 'home_page.dart';

class Splash_screen
    extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() =>
      _Splash_screenState();
}

class _Splash_screenState
    extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          "ADVENTURER'S BACKPACK",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontFamily: "Oswald",
            fontWeight: FontWeight(500),
          ),
        ),
      ),
    );
  }
}

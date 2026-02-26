import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Uygulama());
}

class Uygulama extends StatelessWidget {
  const Uygulama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("baslik"),
          centerTitle: true,
          backgroundColor:
              Colors.purple,
        ),
        body: const Text('merhaba'),
      ),
    );
  }
}

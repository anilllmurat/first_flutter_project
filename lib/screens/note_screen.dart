import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: Text(
          "Adventurer's Backpack",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Save note logic goes here
            },
            icon: Icon(Icons.check),
            color: Colors.white,
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "title",
                contentPadding: EdgeInsets.all(16),
              ),
              maxLines: null,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "your note here",
                  contentPadding: EdgeInsets.all(16),
                ),
                maxLines: null,
                expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

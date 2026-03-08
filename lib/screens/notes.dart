import 'package:flutter/material.dart';
import 'note_screen.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  late Box<Note> noteBox;
  List<Note> myNotes = [];

  @override
  void initState() {
    super.initState();
    noteBox = Hive.box<Note>('myNotesBox');

    myNotes = noteBox.values.toList();
  }

  void _addNewNote() async {
    final Note? newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NoteScreen()),
    );

    if (newNote != null) {
      await noteBox.put(newNote.id, newNote);
      setState(() {
        myNotes.add(newNote);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
        title: Text(
          "Adventurer's Backpack",
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[400],
        actions: [
          IconButton(
            onPressed: () {
              //add note logic goes here
              _addNewNote();
            },
            icon: Icon(Icons.add),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: myNotes.length,
        itemBuilder: (context, index) {
          final currentNote = myNotes[index];

          return ListTile(
            title: Text(currentNote.title),
            subtitle: Text(currentNote.createdAt.toString()),
            onTap: () async {
              final updatedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteScreen(existingNote: currentNote),
                ),
              );

              if (updatedNote != null) {
                await noteBox.put(updatedNote.id, updatedNote);

                setState(() {
                  myNotes[index] = updatedNote;
                });
              }
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';

class NoteScreen extends StatefulWidget {
  final Note? existingNote;
  const NoteScreen({super.key, this.existingNote});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  bool _canPop = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.existingNote != null) {
      _titleController.text = widget.existingNote!.title;
      _contentController.text = widget.existingNote!.content;
    }
  }

  Future<void> _handleBackAction() async {
    final bool? shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("unsaved changes"),
        content: const Text("close without saving?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("close"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("delete and exit"),
          ),
        ],
      ),
    );

    if (shouldPop == true) {
      setState(() {
        _canPop = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleBackAction();
      },

      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text("Adventurer's Backpack"),
          titleTextStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.05,
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Note newNote = Note(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: _titleController.text,
                  content: _contentController.text,
                  createdAt: DateTime.now(),
                );

                setState(() {
                  _canPop = true;
                });

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    Navigator.of(context).pop(newNote);
                  }
                });
              },

              icon: Icon(Icons.check),
              color: Colors.black,
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.yellow[400],
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
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
                  controller: _contentController,
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
      ),
    );
  }
}

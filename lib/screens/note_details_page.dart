import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_1/model/note.dart';
import 'package:new_1/provider/provider.dart';

class NoteDetailsPage extends HookConsumerWidget {
  final Note  note;
  
  const NoteDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: note.content);
    return Scaffold(
      appBar: AppBar (),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: TextField(
              keyboardType: TextInputType.multiline,
              controller: textController,
              maxLines: null, expands: true,
              decoration: InputDecoration(hintText: "Edit Note"),
              ),
            ),
            ElevatedButton(onPressed: () {
              final newNote = Note(
                id: note.id,
                content: textController.text);
              ref.read(notesNotifierProvider.notifier).updateNotes(newNote);
              Navigator.of(context).pop();
            }, child: Text("Save Note")),
          ],
        )
      ),
    );
  }
}

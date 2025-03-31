import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_1/model/note.dart';
import 'package:new_1/provider/provider.dart';

class NoteAddModel extends HookConsumerWidget {
  const NoteAddModel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: TextField(
            keyboardType: TextInputType.multiline,
            controller: textController,
            maxLines: null, expands: true,
            decoration: InputDecoration(hintText: "Enter Note"),
            ),
          ),
          ElevatedButton(onPressed: () {
            final newNote = Note(
              content: textController.text, 
              id: DateTime.now().millisecondsSinceEpoch,
            );
            ref.read(notesNotifierProvider.notifier).addNotes(newNote);
            Navigator.of(context).pop();
          }, child: Text("Save Note")),
        ],
      )
    );
  }
}

void showNoteAddModel(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: 
    (context) => Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
    child: const NoteAddModel()
    ),
  );
}
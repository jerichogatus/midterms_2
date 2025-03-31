import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_1/provider/provider.dart';
import 'package:new_1/screens/note_details_page.dart';
import 'package:new_1/widget/note_add_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Notes App"))),
      body: Container(
        margin: EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];  
            return GridTile(
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                  builder: (_) => NoteDetailsPage(note: note),
                )
              ),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            note.content ?? "",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Center(
                          child: IconButton(
                            onPressed: () => ref
                                .read(notesNotifierProvider.notifier)
                                .deleteNotes(note.id),
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showNoteAddModel(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
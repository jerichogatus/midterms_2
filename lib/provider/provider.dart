import 'package:isar/isar.dart';
import 'package:new_1/database/database.dart';
import 'package:new_1/model/note.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class NotesNotifier extends Notifier<List>{
  @override
  List build() {
    loadNotes();
    return [];
  }

  Future loadNotes() async {
    final notes = await isar.notes.where().findAll();
    state = notes;
  }

  Future addNotes(Note note) async{
    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });
    await loadNotes();
  }

  Future deleteNotes(Id id) async{
    await isar.writeTxn(() async {
      await isar.notes.delete(id);
    });
    await loadNotes();
  }

  Future updateNotes(Note note) async{
    await isar.writeTxn(() async {
      await isar.notes.put(note);
    });
    await loadNotes();
  }
}

final notesNotifierProvider = NotifierProvider<NotesNotifier, List>(
  NotesNotifier.new,
);
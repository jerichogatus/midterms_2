
import 'package:isar/isar.dart';

part 'note.g.dart';

@collection

class Note {
  Id id = Isar.autoIncrement;

  String? content;

  Note({required this.id, required this.content});
}
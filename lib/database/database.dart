import 'package:isar/isar.dart';
import 'package:new_1/model/note.dart';
import 'package:path_provider/path_provider.dart';

late Isar isar;

Future<void> setupIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open([NoteSchema], directory: dir.path);
}
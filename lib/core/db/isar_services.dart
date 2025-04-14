

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:plant/feature/languages/model/language_model.dart';

class IsarService {
  late final Future<Isar> db;

  IsarService() {
    db = _initIsar();
  }

  //init isar
  Future<Isar> _initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [LanguageModelSchema],
      directory: dir.path,
    );
  }
}

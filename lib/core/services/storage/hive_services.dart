import 'package:hive/hive.dart';

class HiveService<T> {
  HiveService(this.boxName);

  final String boxName;
  late final Box<T> _box;

  Future<void> init() async {
    _box = await Hive.openBox<T>(boxName);
  }

  Future<void> saveData(int id, T data) async {
    await _box.put(id, data);
  }

  T? getData(int id) {
    return _box.get(id);
  }

  Future<void> deleteData(int id) async {
    await _box.delete(id);
  }

  Future<void> close() async {
    await _box.close();
  }
}

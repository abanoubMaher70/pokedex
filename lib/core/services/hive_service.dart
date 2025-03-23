import 'package:hive_flutter/hive_flutter.dart';

class HiveService<T> {
  late Box<T> _box;

  /// Initialize Hive and open a box
  Future<void> initHive({
    required String boxName,
    required void Function() registerAdapters,
  }) async {
    await Hive.initFlutter();
    registerAdapters();
    _box = await Hive.openBox<T>(boxName);
  }

  /// Get the opened Hive box
  Box<T> get box => _box;

  /// Save an item in the box
  Future<void> save(int key, T item) async {
    await _box.put(key, item);
  }

  /// Retrieve an item by key
  T? get(int key) {
    return _box.get(key);
  }

  /// Delete an item from the box
  Future<void> delete(int key) async {
    await _box.delete(key);
  }

  /// Get all values stored in the box
  List<T> getAll() {
    return _box.values.toList();
  }

  /// Clear all data in the box
  Future<void> clearAll() async {
    await _box.clear();
  }

  /// Close the box when no longer needed
  Future<void> close() async {
    await _box.close();
  }
}

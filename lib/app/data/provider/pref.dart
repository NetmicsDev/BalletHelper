import 'package:get_storage/get_storage.dart';

class Pref {
  final GetStorage _storage;
  Pref(this._storage);
  GetStorage get storage => _storage;

  getAll() async => await _storage.getValues();
  get({required String key}) => _storage.read(key);

  set({required String key, required dynamic value}) =>
      _storage.write(key, value);

  remove({required String key}) => _storage.remove(key);
}

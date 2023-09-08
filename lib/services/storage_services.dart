

import 'package:flutter_bloc_state/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices{
  late final SharedPreferences  _prefs;
  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async{
    return await _prefs.setBool(key, value);
  }

  bool getDeviceOpen() {
    return _prefs.getBool(STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }
}
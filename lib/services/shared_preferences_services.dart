import 'package:shared_preferences/shared_preferences.dart';

savePreferences(List<String> _results) async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  _preferences.clear();
  _preferences.setStringList("userData", _results);
}

Future<bool> deleteSharedPreference() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  return _preferences.clear();
}

Future<List<String>> loadPersonalData() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  return _preferences.getStringList("userData");
}

Future<String> loadAuthkey() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();

  if (_preferences.getStringList('userData') != null) {
    return _preferences.getStringList('userData')[0];
  } else {
    return null;
  }
}

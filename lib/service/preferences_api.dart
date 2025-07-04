import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences prefs;

  PreferencesService({required this.prefs});

  final String _characterKey = 'characters';

  void storekarakter(List<String> karakter) async {
    await prefs.setStringList(_characterKey, karakter);
  }

  void kayitkarakter(int id) async {
    final karakterlist = await prefs.getStringList(_characterKey) ?? [];
    karakterlist.add(id.toString());
    storekarakter(karakterlist);
  }

  void silkarakter(int id) async {
    final karakterlist = prefs.getStringList(_characterKey) ?? [];
    karakterlist.remove(id.toString());
    storekarakter(karakterlist);
  }

  List<int> getkarakter() {
    final charactersList = prefs.getStringList(_characterKey) ?? [];
    return charactersList.map((e) => int.parse(e)).toList();
  }
}

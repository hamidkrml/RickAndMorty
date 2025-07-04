import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences prefs;

  PreferencesService({required this.prefs});

  final String _characterKey = 'characters';

  void kayitkarakter(int id) async {
    final karakterlist = await prefs.getStringList(_characterKey) ?? [];
    karakterlist.add(id.toString());
    await prefs.setStringList(_characterKey, karakterlist);
  }

  List<int> getkarakter() {
    final charactersList = prefs.getStringList(_characterKey) ?? [];
    return charactersList.map((e) => int.parse(e)).toList();
  }
}

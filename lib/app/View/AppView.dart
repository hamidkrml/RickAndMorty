import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Appview extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const Appview({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarWidget(),
      body: navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        // navigation bar in castim secili olanin rengini degistiriyoruz
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateTextStyle.resolveWith((State) {
            if (State.contains(WidgetState.selected)) {
              return TextStyle(color: Theme.of(context).colorScheme.primary);
            }
            return TextStyle(color: Theme.of(context).colorScheme.tertiary);
          }),
        ),

        /// _menuItem fonksiyonunu kullanarak menu itemlarini olusturuyoruz ve
        /// navigationShell.goBranch fonksiyonunu kullanarak secilen itema gitmesini sagliyoruz
        /// indicatorColor ile secilen itemin altindaki cizgiyi kaldiriyoruz
        /// selectedIndex ile secilen itemi belirliyoruz
        /// onDestinationSelected ile secilen itema gitmesini sagliyoruz
        /// destinations ile menu itemlarini olusturuyoruz
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          indicatorColor: Colors.transparent,
          destinations: [
            _menuItem(
              context,
              index: 0,
              currentIndex: navigationShell.currentIndex,
              label: "Karakterler",
              icon: Icons.face,
            ),
            _menuItem(
              context,
              index: 1,
              currentIndex: navigationShell.currentIndex,
              label: "Favoriler",
              icon: Icons.bookmark,
            ),
            _menuItem(
              context,
              index: 2,
              currentIndex: navigationShell.currentIndex,
              label: "Konumlar",
              icon: Icons.location_on,
            ),
            _menuItem(
              context,
              index: 3,
              currentIndex: navigationShell.currentIndex,
              label: "Menu",
              icon: Icons.menu,
            ),
          ],
        ),
      ),
    );
  }

  /// _menuItem fonksiyonu ile menu itemlarini olusturuyoruz
  /// index ile itemin indexini, currentIndex ile secilen itemin indexini,
  /// label ile itemin labelini, icon ile itemin iconunu aliyoruz
  /// icon ile itemin iconunu aliyoruz
  /// color ile secilen itemin rengini belirliyoruz
  /// label ile itemin labelini belirliyoruz
  Widget _menuItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required String label,
    required IconData icon,
  }) {
    return NavigationDestination(
      icon: Icon(
        icon,
        color: currentIndex == index
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
      ),
      label: 'Menü',
    );
  }

  /// AppBarWidget fonksiyonu ile appbar i olusturuyoruz
  AppBar _AppBarWidget() {
    return AppBar(
      centerTitle: false,
      title: const Text(
        'Rick And Morty',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
    );
  }
}

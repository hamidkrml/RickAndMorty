import 'package:flutter/material.dart';

class AppbarWidgets extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool transparent;
  const AppbarWidgets({
    super.key,
    required this.title,
    this.transparent = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparent ? Colors.transparent : null,
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}

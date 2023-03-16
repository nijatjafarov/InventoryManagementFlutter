import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titl;
  const MyAppBar({super.key, this.titl});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromRGBO(26, 28, 74, 1),
        title: titl);
  }

   @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
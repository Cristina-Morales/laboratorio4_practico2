import 'package:flutter/material.dart';
import 'package:poyecto2/widgets/drawer_menu.dart';
import 'package:poyecto2/widgets/profile.dart';

class ListaDeRegistrosItem extends StatelessWidget {
  const ListaDeRegistrosItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          centerTitle: true,
          leadingWidth: 40,
          toolbarHeight: 80,
        ),
        drawer: DrawerMenu(),
        body: Profile(args: arg));
  }
}

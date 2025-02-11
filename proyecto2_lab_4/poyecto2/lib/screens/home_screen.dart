import 'package:flutter/material.dart';
import 'package:poyecto2/widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        leadingWidth: 40,
        toolbarHeight: 80,
      ),
      drawer: DrawerMenu(),
      body: const Center(child: Text('Bienvenido')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.plus_one),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

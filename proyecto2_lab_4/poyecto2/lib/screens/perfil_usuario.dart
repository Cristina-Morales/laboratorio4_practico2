import 'package:flutter/material.dart';
import 'package:poyecto2/widgets/drawer_menu.dart';
import 'package:poyecto2/widgets/profile.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});

  @override
  Widget build(BuildContext context) {
     final Map<String, dynamic> arguments={
      'nombre': 'Cristina',
      'apellido': 'Morales',
      'direccion': 'Malvinas 1214',
      'telefono': '291 44556677',
      'ocupacion': '',
      'avatar': 'avatar3',
      'favorito': true,
      'profile':true
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        leadingWidth: 40,
        toolbarHeight: 80,
      ),
      drawer: DrawerMenu(),
      body:  Profile(args: arguments)
    );
  }
}
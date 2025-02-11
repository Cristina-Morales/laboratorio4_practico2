import 'package:flutter/material.dart';
import 'package:poyecto2/providers/ThemeProvider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  final Map<String, dynamic> args;
  const Profile({super.key, required this.args});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: Center(
                  child: CircleAvatar(
                radius: 100,
                child: widget.args['avatar'] != ""
                    ? Image.asset('assets/avatars/${widget.args['avatar']}.png')
                    : Image.asset(
                        'assets/avatars/${widget.args['avatar']}.png'),
              ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Nombre: ${widget.args['nombre']}"),
              Text('Favorito: ${widget.args['favorito'] == true ? "si" : "no"}')
            ],
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Apellido: ${widget.args['apellido']}"),
                  Text("Direccion: ${widget.args['direccion']}"),
                  Text("Telefono: ${widget.args['telefono']}"),
                  Text("Cargo: ${widget.args['cargo']}"),
                  if (widget.args['profile'])
                    SwitchListTile.adaptive(
                        title: const Text("Modo oscuro: "),
                        value: themeProvider.darkMode,
                        onChanged: (bool value) {
                          themeProvider.changeTheme(value);
                        })
                ],
              ))
        ],
      ),
    ));
  }
}

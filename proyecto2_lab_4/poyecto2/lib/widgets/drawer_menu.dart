import 'package:flutter/material.dart';
import 'package:poyecto2/helpers/preferences.dart';

class DrawerMenu extends StatelessWidget {

    final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title':'Inicio', 'subtitle':'Ir al inicio'},
    {'route': 'perfil_usuario', 'title':'Perfil', 'subtitle':'Ver perfil'},
    {'route': 'lista_de_registros', 'title':'Ver registros', 'subtitle':'Ver registro de usuarios'},
 //   {'route': '', 'title':'', 'subtitle':''},
  ];
  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ...ListTile.divideTiles(
            context: context,
            tiles: _menuItems
              .map((item) => ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0, horizontal: 10),
                  dense: true,
                  minLeadingWidth: 25,
                  iconColor: Colors.blueGrey,
                  title: Text(item['title']!,
                    style: const TextStyle(
                      fontFamily: 'FuzzyBubbles')),
                  subtitle: Text(item['subtitle'] ?? "",
                  style: const TextStyle(
                    fontFamily: 'RobotoMono', 
                    fontSize: 11)),
                  leading: const Icon(Icons.roundabout_left),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, item['route']!);
                  }
                  ),  
                ).toList())
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;

    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Stack(children: [
          /*  Container(
                height: size.height*0.4,
                width: double.infinity,
                child: Center(
                  child: CircleAvatar(
                    radius: 100,
                    child: Preferences.darkMode 
                      ? Image.asset("assets/background/noche.png")
                      : Image.asset("assets/background/dia.png"),
                  )
              )
            ),*/
            // no pude hacer andar los iconos para dia y noche
        Container(
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            '[  Menu  ]',
            style: TextStyle(
                fontSize: 13, color: Colors.black54, fontFamily: 'RobotoMono'),
            textAlign: TextAlign.right,
          ),
        ),
      ]),
    );
  }
}

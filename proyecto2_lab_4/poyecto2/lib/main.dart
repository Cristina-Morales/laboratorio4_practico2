import 'package:flutter/material.dart';
import 'package:poyecto2/helpers/preferences.dart';
import 'package:poyecto2/screens/lista_de_registros_item.dart';
import 'package:poyecto2/screens/screens.dart';
import 'package:poyecto2/themes/default-theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();
  runApp(const Proyecto2());
}

class Proyecto2 extends StatelessWidget{
  const Proyecto2({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      theme: Preferences.darkMode? DefaultTheme.darkTheme : DefaultTheme.lightTheme,
      routes: {
        'home': (context) => const HomeScreen(),
        'lista_de_registros': (context) => const ListaDeRegistros(),
        'perfil_usuario': (context) => const PerfilUsuario(),
        'detalle_registro': (context) => const ListaDeRegistrosItem()
      }
    );

  }
}
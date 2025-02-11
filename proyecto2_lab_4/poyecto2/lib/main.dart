import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:poyecto2/helpers/preferences.dart';
import 'package:poyecto2/providers/ThemeProvider.dart';
import 'package:poyecto2/screens/lista_de_registros_item.dart';
import 'package:poyecto2/screens/screens.dart';
import 'package:poyecto2/themes/default-theme.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/env/.env"); 
  await Preferences.initShared();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const Proyecto2(),
  ));
}

class Proyecto2 extends StatelessWidget {
  const Proyecto2({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
          themeMode: themeProvider.darkMode ? ThemeMode.dark : ThemeMode.light,
          theme: DefaultTheme.lightTheme,
          darkTheme: DefaultTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: 'home',
          routes: {
            'home': (context) => const HomeScreen(),
            'lista_de_registros': (context) => const ListaDeRegistros(),
            'perfil_usuario': (context) => const PerfilUsuario(),
            'detalle_registro': (context) => const ListaDeRegistrosItem(),
            'listado_gatitos': (context) => const ListadoGatitos()
          });
    });
  }
}

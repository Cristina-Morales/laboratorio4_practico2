import 'package:flutter/material.dart';
import 'package:poyecto2/repository/gatos/entidades/gato.dart';

class DetalleGatito extends StatelessWidget {
  final Datum gatito;
  const DetalleGatito({Key? key, required this.gatito})  : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // 📌 Alinea todo a la izquierda

        children: [
          SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: Center(
                  child: CircleAvatar(
                    radius: 150,
                    backgroundImage: NetworkImage(gatito.imagen),
                    backgroundColor: Colors.transparent,
               // child: Image.network(gatito.imagen, width: 300, height: 100, fit: BoxFit.cover)
              ))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text("Nombre: ${gatito.nombre}",
                  style: TextStyle(fontSize: 20)),
                const SizedBox(width: 20),
                Text('Adoptado: ${gatito.adoptado ? "si" : "no :("}',
                  style: TextStyle(fontSize: 20))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ciudad: ${gatito.ciudad}",
                    style: TextStyle(fontSize: 20,)),
                  Text("Fecha nacimiento: ${gatito.cumple.day}/${gatito.cumple.month}/${gatito.cumple.year} ",
                  style: TextStyle(fontSize: 20,)),
                  Text("Raza: ${gatito.raza}",
                  style: TextStyle(fontSize: 20,)),
                  Text("Sexo: ${gatito.sexo == Sexo.FEMALE? "Hembra": "Macho"}",
                  style: TextStyle(fontSize: 20,)),
                ],
              ))
        ],
      ),
    ));
  }
}
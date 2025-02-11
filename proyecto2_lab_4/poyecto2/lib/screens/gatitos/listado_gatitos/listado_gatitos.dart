

import 'package:flutter/material.dart';
import 'package:poyecto2/repository/gatos/entidades/gato.dart';
import 'package:poyecto2/repository/gatos/gatos_servicio.dart';
import 'package:poyecto2/screens/gatitos/detalle_gatito.dart';
import 'package:poyecto2/widgets/drawer_menu.dart';

class ListadoGatitos extends StatefulWidget {
  const ListadoGatitos({super.key});

  @override
  State<ListadoGatitos> createState() => _ListadoGatitosState();
}

class _ListadoGatitosState extends State<ListadoGatitos> {
  late Future<Gato> futureGatos;

  @override
  void initState(){
    super.initState();
    futureGatos = getGatitos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Gatos")),
      drawer: DrawerMenu(),
      body: FutureBuilder<Gato>(
        future: futureGatos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Error al cargar los datos"));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty ) {
            return const Center(child: Text("No hay gatos disponibles"));
          }

          final gatos = snapshot.data!;
          return listaGatitos(gatos);
        },
      ),
    );
  }
    Expanded listaGatitos(Gato gatos) {
      
   return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: gatos.data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //['Nombre', 'apellido', 'direccion', 'telefono', 'cargo', 'avatar', favorito]
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetalleGatito(gatito: gatos.data[index])));
          
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(31, 206, 219, 246),
                          blurRadius: 4,
                          spreadRadius: 4,
                          offset: Offset(1, 6))
                    ]),
                child: Row(
                  children: [Image.network(gatos.data[index].imagen, width: 100, height: 100, fit: BoxFit.cover),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gatos.data[index].nombre,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(gatos.data[index].raza)
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          gatos.data[index].adoptado ? "adoptado :)": "no adoptado :("
                        ),
                        Text("edad: ${getEdad(gatos.data[index].cumple)}")
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );    }

     String getEdad(DateTime fechaNac){
      DateTime hoy = DateTime.now();
      int edad = hoy.year - fechaNac.year ;
      if (hoy.day<fechaNac.day && hoy.month <fechaNac.month){
        edad = edad-1;
      }
      return edad.toString();
    }

}




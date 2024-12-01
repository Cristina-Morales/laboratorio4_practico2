import 'package:flutter/material.dart';
import 'package:poyecto2/mocks/mock_registros.dart';
import 'package:poyecto2/mocks/mock_registros.dart' show elementos;
import 'package:poyecto2/widgets/drawer_menu.dart';


class ListaDeRegistros extends StatefulWidget {
  const ListaDeRegistros({super.key});

  @override
  State<ListaDeRegistros> createState() => _ListaDeRegistrosState();
}

class _ListaDeRegistrosState extends State<ListaDeRegistros> {
  List _auxiliarElements = [];
  String _searchQuery = '';
  bool _searchActive = false;
  
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _auxiliarElements=elementos;
  }

  void _updateSearch(String? query){
    setState(() {
      _searchQuery = query ?? '';
      if (_searchQuery.isEmpty){
        _auxiliarElements=elementos;
      }else {
        _auxiliarElements = elementos.where((elemento){
          return elemento[0].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ||
          elemento[1].toString().toLowerCase().contains(_searchQuery.toLowerCase())  ||
          elemento[4].toString().toLowerCase().contains(_searchQuery.toLowerCase()) ;
        }).toList();
      }
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: AppBar(
          title: const Text("Home Screen"),
          centerTitle: true,
          leadingWidth: 40,
          toolbarHeight: 80,
        ),
        drawer: DrawerMenu(),
        body: Column(
          children: [SearchArea(), listItemArea()],
        ),
      ),
    );
  }

  Expanded listItemArea(){
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _auxiliarElements.length,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){  //['Nombre', 'apellido', 'direccion', 'telefono', 'cargo', 'avatar', favorito]

              Navigator.pushNamed(context, 'detalle_registro',
              arguments: <String, dynamic>{
                'nombre': elementos[index][0],
                'apellido': elementos[index][1],
                'direccion': elementos[index][2],
                'telefono': elementos[index][3],
                'ocupacion': elementos[index][4],
                'avatar': elementos[index][5],
                'favorito': elementos[index][6],
                'profile':false
              });
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
                    color: Color.fromARGB(31,206,219,246),
                    blurRadius: 4,
                    spreadRadius: 4,
                    offset: Offset(1,6)
                  )
                ]),
                child:Row(
                  children: [
                    Image.asset('assets/avatars/${_auxiliarElements[index][5]}.png',
                      width: 50,
                      height: 50),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(
                          _auxiliarElements[index][1],
                          style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const Text('data')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          );
        }
      ),
    );
  }

  AnimatedSwitcher SearchArea() {
    return AnimatedSwitcher(
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.bounceOut,
      duration: const Duration(milliseconds: 500),
      child: (_searchActive)
        ? Padding( 
        padding:const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _searchController,
                focusNode: _focusNode,
                onChanged: (value){
                  _updateSearch(value);
                },
                onFieldSubmitted: (value) {
                  _updateSearch(value);
                },
                decoration: const InputDecoration(hintText: 'Buscar..'),
              ),
            ),
            IconButton(
              onPressed: (){
                _searchController.clear();
                FocusManager.instance.primaryFocus?.unfocus();
                _updateSearch("");
              },
              icon: const Icon(Icons.clear_rounded),
            ),
            IconButton(
              onPressed: (){
                setState((){
                  _searchActive=false;
                });
              },
              icon: const Icon(Icons.arrow_back),
            )
          ],
        ),
      )
      :Container(
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.keyboard_arrow_left_outlined)
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _searchActive = !_searchActive;  
                });
                _focusNode.requestFocus();
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
      )
    );
  }
  @override
  void dispose(){
    super.dispose();
    _searchController.dispose();
    _focusNode.dispose();
  }
}
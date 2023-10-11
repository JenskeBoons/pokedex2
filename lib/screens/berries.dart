import 'dart:convert';
import 'package:flutter/material.dart'; 
import 'package:pokedex/API/berryapi.dart';
import 'package:pokedex/models/berry_model.dart'; 
import 'package:pokedex/widgets/berry_grid.dart'; 
import 'package:pokedex/widgets/navbar.dart';

class Berries extends StatefulWidget {
  const Berries({Key? key}) : super(key: key);

  @override
  State<Berries> createState() => _BerriesState(); 
}

class _BerriesState extends State<Berries> { 
  List<Berry> berries = List.empty(); 

  @override
  void initState() {
    super.initState();
    getBerriesFromApi(); 
  }

  void getBerriesFromApi() async {
  BerryAPI.getBerries().then((response) {
    List<Map<String, dynamic>> data = List.from(json.decode(response.body)['results']);
    setState(() {
      berries = data.asMap().entries.map<Berry>((element) {
        final berryId = element.key + 1;
        final berryName = element.value['name'];
        final berryImg = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$berryName-berry.png";
        
        return Berry.fromJson({
          'id': berryId,
          'name': berryName,
          'img': berryImg,
        });
      }).toList();
    });
  });
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Search a Berry',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: BerryGrid(berries: berries), 
      bottomNavigationBar: const NavBar(),
    );
  }
}

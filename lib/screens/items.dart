import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/API/itemapi.dart';
import 'package:pokedex/models/item_model.dart'; // Import your Item model
import 'package:pokedex/widgets/item_grid.dart'; // Import your ItemGrid widget
import 'package:pokedex/widgets/navbar.dart';

class Items extends StatefulWidget {
  const Items({Key? key}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState(); // Change the state class name
}

class _ItemsState extends State<Items> { // Change the state class name
  List<Item> items = List.empty(); // Change the variable name

  @override
  void initState() {
    super.initState();
    getItemsFromApi(); // Change the method name
  }

  void getItemsFromApi() async { // Change the method name
    ItemAPI.getItems().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        items = data.asMap().entries.map<Item>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
               "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/${element.value['name']}.png";
          return Item.fromJson(element.value);
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
                    'Search an Item', // Change the text
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ItemGrid(items: items), // Change the variable name
      bottomNavigationBar: const NavBar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloflutter/models/catalog.dart';
import 'package:helloflutter/widgets/drawer.dart';
import 'package:helloflutter/widgets/item_widget.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Flutter";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData()async {
    var catalogJson = await rootBundle.loadString("assets/files/file.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];

  }

  @override
  Widget build(BuildContext context) {
   // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: Text("Catalog App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: CatalogModel.items[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

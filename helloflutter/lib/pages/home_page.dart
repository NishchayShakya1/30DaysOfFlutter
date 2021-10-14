import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:helloflutter/core/store.dart';
import 'package:helloflutter/models/cart.dart';
import 'package:helloflutter/models/catalog.dart';
import 'package:helloflutter/utils/routes.dart';
import 'package:helloflutter/widgets/home_widgets/catalog_header.dart';
import 'package:helloflutter/widgets/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Flutter";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // var catalogJson = await rootBundle.loadString("assets/files/file.json");\
    var response = await http.get(Uri.parse(url));
    var catalogJson = response.body;
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as Mystore).cart;
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _, mut) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),

          // ignore: deprecated_member_use
          backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart_fill, color: Colors.white),
        ).badge(
            position: VxBadgePosition.rightTop,
            color: Vx.gray200,
            size: 20,
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
            else
              CircularProgressIndicator().centered().py16().expand(),
          ]),
        ),
      ),
    );
  }
}









     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     
     //deleted
     // appBar: AppBar(title: Text("Catalog App")),
     // body: Padding(
       // padding: const EdgeInsets.all(16.0),
      //   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
      //       ? GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             mainAxisSpacing: 16,
      //             crossAxisSpacing: 16,
      //           ),
      //           itemBuilder: (context, index) {
      //             final item = CatalogModel.items[index];
      //             return Card(
      //                 clipBehavior: Clip.antiAlias,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10)),
      //                 child: GridTile(
      //                   header: Container(
      //                     child: Center(
      //                       child: Text(
      //                         item.name,
      //                         style: TextStyle(
      //                             color: Colors.white,
      //                             fontWeight: FontWeight.bold),
      //                       ),
      //                     ),
      //                     padding: EdgeInsets.all(12),
      //                     decoration: BoxDecoration(color: Colors.deepPurple),
      //                   ),
      //                   child: Image.asset(item.image),
      //                   footer: Text(item.price.toString()),
      //                 ));
      //           },
      //           itemCount: CatalogModel.items.length,
      //         )
      //       : Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // ),
      // drawer: MyDrawer(),


// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:helloflutter/models/catalog.dart';
import 'package:helloflutter/pages/home_detail_page.dart';
import 'package:helloflutter/widgets/home_widgets/add_to_cart.dart';
import 'package:helloflutter/widgets/home_widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              // final catalog = CatalogModel.getbyPosition(index);
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(catalog: catalog
                              //CatalogModel.getById(2)
                              ))),
                  child: CatalogItem(catalog: catalog));
            })
        : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              // final catalog = CatalogModel.getbyPosition(index);
              return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeDetailPage(catalog: catalog
                              //CatalogModel.getById(2)
                              ))),
                  child: CatalogItem(catalog: catalog));
            });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image),
      ),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(7.0)),
          catalog.name.text.lg.xl2.color(context.accentColor).bold.make(),
          catalog.desc.text
              .textStyle(
                context.captionStyle,
              )
              .make(),
          25.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mH2,
            children: [
              "\$${catalog.price}".text.bold.xl.make(),
              AddToCart(catalog: catalog)
            ],
          ).pOnly(right: 10.0)
        ],
      ).p(context.isMobile ? 0 : 30))
    ];
    return VxBox(
            child: context.isMobile
                ? Row(
                    children: children2,
                  )
                : Column(children: children2))
        .color(context.cardColor)
        .roundedLg
        .square(150)
        .make()
        .py16()
        .px0();
  }
}

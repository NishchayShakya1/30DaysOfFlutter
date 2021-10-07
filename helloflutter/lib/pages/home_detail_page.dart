import 'package:flutter/material.dart';
import 'package:helloflutter/models/catalog.dart';
import 'package:helloflutter/utils/routes.dart';
import 'package:helloflutter/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[800],
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mH8,
        children: [
          "\$${catalog.price}".text.white.bold.xl2.make(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.cartRoute);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                shape: MaterialStateProperty.all(
                  StadiumBorder(),
                )),
            child: "Add to Cart".text.make(),
          ).wh(110, 40)
        ],
      ).p24(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(catalog.id), child: Image.asset(catalog.image))
                .h32(context)
                .p32(),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.grey[700],
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.lg.xl4
                        .color(MyTheme.darkBluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.black.xl
                        .textStyle(context.captionStyle)
                        .make(),
                    "Sanctus no takimata sanctus est clita ea et nonumy, lorem vero dolores dolore vero. Ipsum stet takimata dolor dolore dolores diam sit. Invidunt et takimata amet eos et et eirmod gubergren rebum. Vero lorem amet ut amet, ipsum tempor justo eos stet ut justo eirmod. Rebum duo voluptua rebum lorem."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p16()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:helloflutter/models/catalog.dart';

import 'package:helloflutter/widgets/home_widgets/add_to_cart.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.theme.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH0,
          children: [
            "\$${catalog.price}"
                .text
                .color(context.accentColor)
                .bold
                .xl3
                .make(),
            AddToCart(catalog: catalog).wh(110, 40)
          ],
        ).py8().px16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.asset(catalog.image))
                .h32(context)
                .p32(),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.lg.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
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

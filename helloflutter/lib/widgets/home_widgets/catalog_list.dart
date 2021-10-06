import 'package:flutter/material.dart';
import 'package:helloflutter/models/catalog.dart';
import 'package:helloflutter/pages/home_detail_page.dart';
import 'package:helloflutter/widgets/home_widgets/catalog_image.dart';
import 'package:helloflutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog))),
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
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id),
          child: CatalogImage(image: catalog.image),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(8.0)),
            catalog.name.text.lg.xl2.color(MyTheme.darkBluishColor).bold.make(),
            catalog.desc.text.black
                .textStyle(
                  context.captionStyle,
                )
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}".text.black.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyTheme.darkBluishColor,
                      ),
                      shape: MaterialStateProperty.all(
                        StadiumBorder(),
                      )),
                  child: "Buy".text.make(),
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).blue100.roundedLg.square(150).make().py16();
  }
}

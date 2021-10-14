import 'package:flutter/material.dart';
import 'package:helloflutter/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(
        //shape: StadiumBorder(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: ListTile(
            onTap: () {
              print(item.name);
            },
            leading: Image.asset(
              //asset
              item.image,
            ),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text(
              "\$${item.price}",
              textScaleFactor: 1.5,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

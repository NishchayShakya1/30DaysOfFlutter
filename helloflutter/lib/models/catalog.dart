class CatalogModel {
  static final items = [
    Item(
        id: "1",
        name: "iphone 13 Pro",
        desc: "Aukat ke Bahar",
        price: 999,
        color: "#33505a",
        image: "assets/images/iphone13pro.png")
  ];
}

class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}



import 'package:helloflutter/core/store.dart';
import 'package:helloflutter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  // catalog fields
  CatalogModel _catalog;
  
  // Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];
  
  // Get Catalog
  CatalogModel get catalog => _catalog;

  
  set catalog(CatalogModel newCatalog){
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get Item in the Cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  // Add Item
  // void add(Item item){
  //   _itemIds.add(item.id);
  // }

   // remove  Item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
  
  
}

class AddMutation extends VxMutation<Mystore> {
  final Item item;
  
  AddMutation(this.item);
  @override
  perform() {
  
    store.cart._itemIds.add(item.id);
  } 
}
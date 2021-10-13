// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:helloflutter/core/store.dart';
import 'package:helloflutter/models/cart.dart';

import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Mystore).cart;
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
           
            mutations: {RemoveMutation},
            builder: (context,_) {
              return "\$${_cart.totalPrice}"
              .text
              .xl4
              .color(context.theme.accentColor)
              .make();
            },
            ),
        
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not Supported Yet"
                          .text
                          .color(context.theme.accentColor)
                          .align(TextAlign.center)
                          .make(),
                      backgroundColor: context.theme.canvasColor,
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.white.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [RemoveMutation]);
    final CartModel _cart = (VxState.store as Mystore).cart;
    return _cart.items.isEmpty
        ? "Nothing To Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () => RemoveMutation(_cart.items[index])
                  // setState(() {});
                  ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}

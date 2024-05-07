
import 'package:flutter/material.dart';
import 'package:shoezo_app/functions/cart_functions.dart';
import 'package:shoezo_app/models/cart_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getAllShoesCart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          '$totalPrice',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: cartListNotifier,
        builder: (context, List<CartModel> cart, Widget? child) {
          return ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final data = cart[index];
              return ProductItem(
                title: data.name,
                subtitle: data.price,
                index: index,
                image: data.image,
              );
            },
          );
        },
      ),
    );
  }

  Widget ProductItem({
    required int index,
    required String title,
    required String subtitle,
    required String image,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Card(
          elevation: 6,
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deleteShoesCart(index);
                    getAllShoesCart();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  double totalPrice = 0;
  double cartTotalPrice() {
    List<CartModel> cartItem = [];

    for (var cartItem in cartItem) {
      totalPrice += double.parse(cartItem.price);
    }
    return totalPrice;
  }
}

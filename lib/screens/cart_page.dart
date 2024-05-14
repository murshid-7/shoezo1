import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoezo_app/functions/cart_functions.dart';
import 'package:shoezo_app/models/cart_model.dart';
import 'package:shoezo_app/screens/edit_product_page.dart';
import 'dart:io';

import 'package:shoezo_app/screens/home_page.dart';
import 'package:shoezo_app/widgets/bottom_nav.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    getAllShoesCart();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNav(),
                  )),
            ),
            ValueListenableBuilder(
              valueListenable: cartListNotifier,
              builder: (context, List<CartModel> cart, Widget? child) {
                return Text(
                  'Total : $totalPrice',
                  style: const TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black,
                  ),
                );
              },
            ),
          ],
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
                context: context,
              );
            },
          );
        },
      ),
    );
  }

  Widget ProductItem({
    required BuildContext context,
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
        SizedBox(
          height: 120,
          child: Card(
            elevation: 6,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ListTile(
              leading: Image.file(File(image)),
              title: Text(title),
              subtitle: Text(subtitle),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      getAllShoesCart();
                      deleteShoesCart(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditShoeScreen(
                          name: title,
                          price: subtitle,
                          index: index,
                          imagePath: image,
                        ),
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

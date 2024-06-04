import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoezo_app/models/cart_model.dart';

class CartService {
    Future getAllShoesCart() async {
      final shoeDB = await Hive.openBox<CartModel>('cart');
      return shoeDB.values.toList();
    }

  Future addShoesCart(CartModel value) async {
    final shoeDB = await Hive.openBox<CartModel>('cart');
    return shoeDB.add(value);
  }

  Future deleteShoesCart(index) async {
    final shoeDB = await Hive.openBox<CartModel>('cart');
    await shoeDB.deleteAt(index);
  }
}

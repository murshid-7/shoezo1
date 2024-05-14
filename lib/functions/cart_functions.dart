import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoezo_app/models/cart_model.dart';

ValueNotifier<List<CartModel>> cartListNotifier = ValueNotifier([]);
double totalPrice = 0;

Future<void> addShoesCart(CartModel value) async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  await shoeDB.add(value);

  // Update totalPrice by adding the price of the newly added item
  totalPrice += double.parse(value.price);

  cartListNotifier.notifyListeners();
}

Future<void> getAllShoesCart() async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  cartListNotifier.value.clear();
  cartListNotifier.value.addAll(shoeDB.values);
  // Calculate total price after fetching items
  calculateTotalPrice();
  cartListNotifier.notifyListeners();
}

Future<void> deleteShoesCart(index) async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  final deletedItem = cartListNotifier.value[index];
  await shoeDB.deleteAt(index);

  // Deduct the price of the deleted item from the total price

  cartListNotifier.notifyListeners();
}

void calculateTotalPrice() {
  totalPrice = 0; // Reset totalPrice
  for (var item in cartListNotifier.value) {
    totalPrice += double.parse(item.price);
  }
}

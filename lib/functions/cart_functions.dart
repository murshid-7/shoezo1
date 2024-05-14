import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoezo_app/models/cart_model.dart';

ValueNotifier<List<CartModel>> cartListNotifier = ValueNotifier([]);
double totalPrice = 0; // Moved totalPrice to the top level

Future<void> addShoesCart(CartModel value) async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  await shoeDB.add(value);
  cartListNotifier.notifyListeners();
  // Calculate total price after adding an item
  calculateTotalPrice();
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
  await shoeDB.deleteAt(index);
  // Calculate total price after deleting an item
  calculateTotalPrice();
  cartListNotifier.notifyListeners();
}

void calculateTotalPrice() {
  totalPrice = 0; // Reset totalPrice
  for (var item in cartListNotifier.value) {
    totalPrice += double.parse(item.price);
  }
}

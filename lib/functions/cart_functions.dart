// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoezo_app/models/cart_model.dart';

ValueNotifier<List<CartModel>> cartListNotifier = ValueNotifier([]);
double totalPrice = 0;

Future<void> addShoesCart(CartModel value) async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  await shoeDB.add(value);

  totalPrice += double.parse(value.price);

  cartListNotifier.notifyListeners();
}
// future<void>Addshoescart(cartmodel value)async{
// final shoedb=await hive.initflutter}

Future<void> getAllShoesCart() async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  cartListNotifier.value.clear();
  cartListNotifier.value.addAll(shoeDB.values);

  calculateTotalPrice();
  cartListNotifier.notifyListeners();
}

Future<void> deleteShoesCart(index) async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  final deletedItem = cartListNotifier.value[index];
  await shoeDB.deleteAt(index);

  cartListNotifier.notifyListeners();
}

void calculateTotalPrice() {
  totalPrice = 0;
  for (var item in cartListNotifier.value) {
    totalPrice += double.parse(item.price);
   
  }
}

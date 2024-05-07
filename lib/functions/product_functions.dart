
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shoezo_app/functions/cart_functions.dart';
import 'package:shoezo_app/models/cart_model.dart';
import 'package:shoezo_app/models/shoe_model.dart';

ValueNotifier<List<ShoeModel>> shoeListNotifier = ValueNotifier([]);
ValueNotifier<List<CartModel>> cartListNotifier = ValueNotifier([]);

Future<void> addShoes(ShoeModel value) async {
  final shoeDB = await Hive.openBox<ShoeModel>('name');
  await shoeDB.add(value);
  shoeListNotifier.value.add(value);
  shoeListNotifier.notifyListeners();
}

Future<void> getAllShoes() async {
  final shoeDB = await Hive.openBox<ShoeModel>('name');
  shoeListNotifier.value.clear();
  shoeListNotifier.value.addAll(shoeDB.values);
  shoeListNotifier.notifyListeners();
}

Future<void> deleteShoe(index) async {
  final shoeDB = await Hive.openBox<ShoeModel>('name');
  shoeDB.deleteAt(index);
  shoeListNotifier.notifyListeners();
  getAllShoes();
}

Future<void> editShoes(index, ShoeModel value) async {
  final shoeDB = await Hive.openBox<ShoeModel>('name');
  shoeListNotifier.value.clear();
  shoeListNotifier.value.addAll(shoeDB.values);
  shoeListNotifier.notifyListeners();
  shoeDB.putAt(index, value);
  getAllShoes();
}

Future<void> deleteAllDataShoes() async {
  await Hive.box<ShoeModel>('name').clear();
  await Hive.box<CartModel>('cart').clear();
  getAllShoes();
  getAllShoesCart();
  shoeListNotifier.notifyListeners();
  cartListNotifier.notifyListeners();
}

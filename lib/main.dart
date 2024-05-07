import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shoezo_app/models/cart_model.dart';
import 'package:shoezo_app/models/shoe_model.dart';
import 'package:shoezo_app/screens/login_page.dart';

const save_key = 'userlogin';
void main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ShoeModelAdapter().typeId)) {
    Hive.registerAdapter(ShoeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
    Hive.registerAdapter(CartModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}

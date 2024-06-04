import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoezo_app/controller/add_provider.dart';
import 'package:shoezo_app/controller/cart_provider.dart';
import 'package:shoezo_app/controller/product_provider.dart';
import 'package:shoezo_app/models/cart_model.dart';
import 'package:shoezo_app/models/shoe_model.dart';
import 'package:shoezo_app/view/splash_screen.dart';

// ignore: constant_identifier_names
const save_key = 'userlogin';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

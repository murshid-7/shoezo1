// ignore_for_file: unused_field, prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:shoezo_app/screens/add_product.dart';
import 'package:shoezo_app/screens/home_page.dart';
import 'package:shoezo_app/screens/product_chart_page.dart';


class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: _getBodyWidget(_currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add_chart_rounded),
            title: Text('Product Chart'),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.add),
            title: Text('Add Product'),
            activeColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _getBodyWidget(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return ProductChart();
      case 2:
        return AddProduct();
      case 3:
      default:
        return HomeScreen();
    }
  }
}

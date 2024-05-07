

import 'package:flutter/material.dart';

class ProductChart extends StatelessWidget {
  const ProductChart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(image: NetworkImage('https://tse4.mm.bing.net/th?id=OIP.AB6bbHAitUJ80yqB1tqznQHaFU&pid=Api&P=0&h=180')),
        ),
      ),
    );
  }
}

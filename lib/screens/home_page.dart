// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoezo_app/functions/product_functions.dart';
import 'package:shoezo_app/models/shoe_model.dart';
import 'package:shoezo_app/screens/brands_page.dart';
import 'package:shoezo_app/screens/details_screen.dart';
import 'package:shoezo_app/widgets/app_drawer.dart';
import 'package:shoezo_app/widgets/carousel_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getAllShoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 220, 217),
      body: SafeArea(
          child: Column(
        children: [
          DrawerBarTop(),
          SizedBox(height: 5),
          roundedCarousel(),
          SizedBox(height: 5),
          Text(
            'Shop Your Favourite Brands From Here ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          BrandsLogo(),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: shoeListNotifier,
              builder: (context, List<ShoeModel> shoeList, Widget? child) {
                return buildShoeList(shoeList);
              },
            ),
          ),
        ],
      )),
      drawer: Drawer1(),
    );
  }
}

Widget buildShoeList(List<ShoeModel> shoe) {
  return shoe.isEmpty
      ? const Center(
          child: Text('Empty'),
        )
      : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 10),
          itemCount: shoe.length,
          itemBuilder: (context, index) {
            final data = shoe[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      name: data.name,
                      price: data.price.toString(),
                      disciption: '',
                      image: data.image,
                    ),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.only(left: 10, right: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                        child: Image.file(
                      File(data.image),
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain,
                    )),
                    Text(
                      data.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Price:${data.price}'),
                    Text('Brand: ${data.catagory}'),
                  ],
                ),
              ),
            );
          },
        );
}

// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shoezo_app/functions/product_functions.dart';
import 'package:shoezo_app/models/shoe_model.dart';
import 'package:shoezo_app/screens/details_screen.dart';

class AdidasStore extends StatelessWidget {
  AdidasStore({Key? key});

  @override
  Widget build(BuildContext context) {
    getAllShoes();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black.withOpacity(0.9),
          title: Row(
            children: [
              IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              SizedBox(width: 70),
              Text('ADIDAS STORE', style: TextStyle(color: Colors.white))
            ],
          )),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<List<ShoeModel>>(
              valueListenable: shoeListNotifier,
              builder:
                  (BuildContext context, List<ShoeModel> shoe, Widget? child) {
                final filteredList = shoe
                    .where(
                        (element) => element.catagory.toLowerCase() == 'adidas')
                    .toList();
                return filteredGrid(context, filteredList);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget filteredGrid(BuildContext context, List<ShoeModel> shoeList) {
    return shoeList.isEmpty
        ? const Center(
            child: Text('Empty'),
          )
        : ListView.builder(
            itemCount: shoeList.length,
            itemBuilder: (context, index) {
              final data = shoeList[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        name: data.name,
                        price: data.price,
                        disciption: '',
                        image: data.image,
                      ),
                    ),
                  );
                },
                child: Card(
                  color: Colors.white,
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 150,
                        child: Image.file(File(data.image)),
                      ),
                      Column(
                        children: [
                          Text(
                            data.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Brand:${data.catagory}"),
                          Text('Price: ${data.price}'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}

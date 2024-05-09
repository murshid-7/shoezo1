import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shoezo_app/functions/product_functions.dart';
import 'package:shoezo_app/models/shoe_model.dart';
import 'package:shoezo_app/screens/details_screen.dart';
import 'package:shoezo_app/widgets/bottom_nav.dart';

class PumaStore extends StatelessWidget {
  const PumaStore({Key? key});

  @override
  Widget build(BuildContext context) {
    getAllShoes();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.black.withOpacity(0.9),
        title: const Text(
          'Puma Store',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<List<ShoeModel>>(
              valueListenable: shoeListNotifier,
              builder:
                  (BuildContext context, List<ShoeModel> shoe, Widget? child) {
                final filteredList = shoe
                    .where(
                        (element) => element.catagory.toLowerCase() == 'puma')
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
                child: Container(
                  color: Colors.grey,
                  padding: const EdgeInsets.all(2.5),
                  margin: const EdgeInsets.all(6),
                  height: 130,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 150,
                        child: Image.file(File(data.image)),
                      ),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.all(10)),
                          Text(data.name),
                          Text(data.catagory),
                          Text(data.price)
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

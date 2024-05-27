import 'package:flutter/material.dart';
import 'package:shoezo_app/functions/product_functions.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //   style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
            //   onPressed: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => AllProductScreen()));
            //   },
            //   child: Text('View Products',style: TextStyle(color: Colors.white),),
            // ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                deleteAllDataShoes();
              },
              child: const Text(
                'Delete All Products',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoezo_app/functions/cart_functions.dart';
import 'package:shoezo_app/functions/product_functions.dart';
import 'package:shoezo_app/widgets/bottom_nav.dart';

class MyPieChart1 extends StatelessWidget {
  const MyPieChart1({Key? key});

  @override
  Widget build(BuildContext context) {
    getAllShoes();
    getAllShoesCart();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomNav()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            const Text(
              'Product Chart',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.amber[50],
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: PieChart(PieChartData(sections: [
                      PieChartSectionData(
                        value: totalPrice,
                        color: Colors.blue,
                        showTitle: true,
                        title: 'Cart total: $totalPrice',
                        titleStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        titlePositionPercentageOffset: 2,
                      ),
                      PieChartSectionData(
                        value: productTotalPrice(),
                        color: Colors.red,
                        showTitle: true,
                        title: 'All product total: ${productTotalPrice()}',
                        titleStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        titlePositionPercentageOffset: 2,
                      ),
                      // PieChartSectionData(value: 36, color: Colors.amber),
                      // PieChartSectionData(value: 20, color: Colors.green)
                    ])),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        color: Colors.red,
                        child:const  Text('Total Price'),
                      ),
                     const SizedBox(width: 30),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        color: Colors.blue,
                        child: const Text('Total Price'),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Text(
              'BRANDS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shoezo_app/widgets/bottom_nav.dart';

class MyPieChart1 extends StatelessWidget {
  const MyPieChart1({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              color: Colors.amber[100],
              margin: const EdgeInsets.all(10.0),
              child: PieChart(PieChartData(sections: [
                PieChartSectionData(value: 100, color: Colors.blue),
                PieChartSectionData(value: 0, color: Colors.red),
                PieChartSectionData(value: 36, color: Colors.amber),
                PieChartSectionData(value: 20, color: Colors.green)
              ])),
            ),
           const Text(
              'BRANDS',
              style:TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

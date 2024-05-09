import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyPieChart1 extends StatelessWidget {
  const MyPieChart1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            'BRANDS',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          PieChart(PieChartData(sections: [
            PieChartSectionData(value: 100, color: Colors.blue),
            PieChartSectionData(value: 35, color: Colors.red),
            PieChartSectionData(value: 36, color: Colors.amber),
            PieChartSectionData(value: 20, color: Colors.green)
          ]))
        ],
      ),
    );
  }
}

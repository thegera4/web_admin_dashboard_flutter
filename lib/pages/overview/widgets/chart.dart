import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
    const Chart({Key? key}) : super(key: key);

@override
    Widget build(BuildContext context) {
        final List<SalesData> chartData = [
            SalesData(2010, 35),
            SalesData(2011, 28),
            SalesData(2012, 34),
            SalesData(2013, 32),
            SalesData(2014, 40)
        ];
        return Scaffold(
            body: Center(
                child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                        // Renders line chart
                        LineSeries<SalesData, int>(
                            dataSource: chartData,
                            xValueMapper: (SalesData sales, _) => sales.year,
                            yValueMapper: (SalesData sales, _) => sales.sales
                        )
                    ]
                )
            )
        );
    }
}

    class SalesData {
        SalesData(this.year, this.sales);
        final int year;
        final double sales;
    }
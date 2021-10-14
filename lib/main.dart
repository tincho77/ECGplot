import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/core.dart';

void main() {
  // Register your license here

  return runApp(ChartApp());
}

class ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: Container(
          child: SfCartesianChart(
              //backgroundColor: Colors.amber,
              plotAreaBorderWidth: 2,
              plotAreaBorderColor: Colors.black38,
              title:
                  ChartTitle(text: 'ECG DATA', alignment: ChartAlignment.near),
              primaryXAxis: NumericAxis(
                  interval: 100,
                  rangePadding: ChartRangePadding.additional,
                  axisLine: AxisLine(color: Colors.black38),
                  majorGridLines: MajorGridLines(width: 0),
                  minorGridLines: MinorGridLines(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.hide),
              primaryYAxis: NumericAxis(
                  minimum: -5,
                  maximum: 25,
                  interval: 5,
                  rangePadding: ChartRangePadding.additional,
                  axisLine: AxisLine(color: Colors.black38),
                  majorGridLines: MajorGridLines(width: 0),
                  minorGridLines: MinorGridLines(width: 0),
                  edgeLabelPlacement: EdgeLabelPlacement.hide),
              annotations: <CartesianChartAnnotation>[
                CartesianChartAnnotation(
                    x: 355,
                    y: 22,
                    coordinateUnit: CoordinateUnit.point,
                    widget: Container(
                      child: Text(
                        'High',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    region: AnnotationRegion.chart),
                CartesianChartAnnotation(
                    x: 390,
                    y: 0,
                    coordinateUnit: CoordinateUnit.point,
                    widget: Container(
                      child: Text(
                        'low',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    region: AnnotationRegion.chart)
              ],
              series: <ChartSeries<EcgData, double>>[
                SplineSeries<EcgData, double>(
                  color: Colors.green,
                  dataSource: <EcgData>[
                    EcgData(0, 2),
                    EcgData(50, 2),
                    EcgData(100, 2),
                    EcgData(150, 2),
                    EcgData(200, 2),
                    EcgData(250, 0),
                    EcgData(260, 1),
                    EcgData(280, 3),
                    EcgData(290, 1),
                    EcgData(300, 2),
                    EcgData(310, 4),
                    EcgData(320, 5),
                    EcgData(330, 10),
                    EcgData(340, 15),
                    EcgData(350, 20),
                    EcgData(360, 15),
                    EcgData(370, -4),
                    EcgData(380, -3),
                    EcgData(390, -4),
                    EcgData(400, -6),
                    EcgData(420, -2),
                    EcgData(450, 0),
                    EcgData(500, -1),
                    EcgData(550, -1),
                    EcgData(600, -1),
                    EcgData(650, -1),
                    EcgData(700, -1),
                  ],
                  xValueMapper: (EcgData sales, _) => sales.value1,
                  yValueMapper: (EcgData sales, _) => sales.value2,
                ),
                SplineSeries<EcgData, double>(
                  color: Colors.red,
                  dataSource: <EcgData>[
                    EcgData(0, 1),
                    EcgData(100, 1),
                    EcgData(200, 1),
                    EcgData(250, -1),
                    EcgData(260, 2),
                    EcgData(270, 4),
                    EcgData(280, 2),
                    EcgData(300, 3),
                    EcgData(350, 13),
                    EcgData(370, -4),
                    EcgData(380, -2),
                    EcgData(390, -3),
                    EcgData(400, -4),
                    EcgData(420, -1),
                    EcgData(450, 1),
                    EcgData(500, -3),
                    EcgData(550, -3),
                    EcgData(600, -3),
                    EcgData(650, -3),
                    EcgData(700, -1),
                  ],
                  xValueMapper: (EcgData sales, _) => sales.value1,
                  yValueMapper: (EcgData sales, _) => sales.value2,
                )
              ]),
        ));
  }
}

class EcgData {
  EcgData(this.value1, this.value2);

  final double value1;
  final double value2;
}

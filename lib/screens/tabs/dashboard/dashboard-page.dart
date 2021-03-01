import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:weight_control/misc/constants.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorMain),
      appBar: AppBar(
        title: Text("Сводная информация"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Прогресс",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              color:
                                  Color(colorContainerWithStartEndValuesWeight),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LineAwesomeIcons.arrow_circle_up,
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("Начальный вес"),
                                          Text(
                                            "120 кг",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              color:
                                  Color(colorContainerWithStartEndValuesWeight),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LineAwesomeIcons.arrow_circle_down,
                                      color: Colors.green,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("Желаемый вес"),
                                          Text(
                                            "90 кг",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.15,
                                thicknessUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.bothCurve,
                              ),
                              showTicks: false,
                              showLabels: false,
                              onAxisTapped: (value) {},
                              pointers: <GaugePointer>[
                                RangePointer(
                                  color: Color(
                                      colorContainerWithStartEndValuesWeight),
                                  value: 13,
                                  onValueChanged: (value) {},
                                  cornerStyle: CornerStyle.bothCurve,
                                  onValueChangeEnd: (value) {},
                                  onValueChanging: (value) {},
                                  enableDragging: false,
                                  width: 0.15,
                                  sizeUnit: GaugeSizeUnit.factor,
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("Сейчас"),
                                          Text(
                                            "120",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text("-13 кг"),
                                    ],
                                  ),
                                  positionFactor: 0.05,
                                  // angle: 0.5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              color:
                                  Color(colorContainerWithStartEndValuesWaist),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LineAwesomeIcons.arrow_circle_up,
                                      color: Colors.red,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("Начальный объем"),
                                          Text(
                                            "120 см",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              color:
                                  Color(colorContainerWithStartEndValuesWaist),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      LineAwesomeIcons.arrow_circle_down,
                                      color: Colors.green,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("Желаемый объем"),
                                          Text(
                                            "90 см",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        child: SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.15,
                                thicknessUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.bothCurve,
                              ),
                              showTicks: false,
                              showLabels: false,
                              onAxisTapped: (value) {},
                              pointers: <GaugePointer>[
                                RangePointer(
                                  color: Color(
                                      colorContainerWithStartEndValuesWaist),
                                  value: 48,
                                  onValueChanged: (value) {},
                                  cornerStyle: CornerStyle.bothCurve,
                                  onValueChangeEnd: (value) {},
                                  onValueChanging: (value) {},
                                  enableDragging: false,
                                  width: 0.15,
                                  sizeUnit: GaugeSizeUnit.factor,
                                ),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            child: Text("Сейчас"),
                                          ),
                                          Text(
                                            "120",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text("-13 см"),
                                    ],
                                  ),
                                  positionFactor: 0.05,
                                  // angle: 0.5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 2.0,
                padding: EdgeInsets.all(10.0),
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    color: Color(colorContainerWithStartEndValuesWaist),
                    child: Text("111"),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    color: Color(colorContainerWithStartEndValuesWaist),
                    child: Text("222"),

                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    color: Color(colorContainerWithStartEndValuesWaist),
                    child: Text("222"),

                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    color: Color(colorContainerWithStartEndValuesWaist),
                    child: Text("222"),

                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

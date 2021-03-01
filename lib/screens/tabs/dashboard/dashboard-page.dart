import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<AnimatedCircularChartState> _chartWeightGreyKey =
      new GlobalKey<AnimatedCircularChartState>();

  final GlobalKey<AnimatedCircularChartState> _chartWeightBlueKey =
      new GlobalKey<AnimatedCircularChartState>();

  final GlobalKey<AnimatedCircularChartState> _chartWaistGreyKey =
      new GlobalKey<AnimatedCircularChartState>();

  final GlobalKey<AnimatedCircularChartState> _chartWaistRedKey =
      new GlobalKey<AnimatedCircularChartState>();

  final currentWeightKey = GlobalKey();
  final chartKeyContainer = GlobalKey();
  final startWeightKey = GlobalKey();
  final endWeightKey = GlobalKey();

  final currentWaistKey = GlobalKey();
  final chartKeyContainer2 = GlobalKey();
  final startWaistKey = GlobalKey();
  final endWaistKey = GlobalKey();

  Size size = Size(0, 0);
  Size size2 = Size(0, 0);
  Size sizeOfChartContainer = Size(0, 0);

  Size sizeOfEndWeight = Size(0, 0);
  double deltaOfEndWeight = 0.0;

  Size sizeOfCurrentWeight = Size(0, 0);
  double deltaOfCurrentWeightSize = 0.0;

  Size sizeOfStartWeight = Size(0, 0);
  double deltaOfStartWeight = 0.0;

  Size sizeofCurrentWaist = Size(0, 0);
  double deltaOfCurrentWaistSize = 0.0;

  @override
  void initState() {
    calculateSizeOfWidget();
    super.initState();
  }

  void calculateSizeOfWidget() =>
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final RenderBox boxChartContainer =
            chartKeyContainer.currentContext.findRenderObject();
        final RenderBox boxCurrentWeight =
            currentWeightKey.currentContext.findRenderObject();
        final RenderBox boxStartWeight =
            startWeightKey.currentContext.findRenderObject();
        final RenderBox boxEndWeight =
            endWeightKey.currentContext.findRenderObject();
        final RenderBox boxCurrentWaist =
        currentWaistKey.currentContext.findRenderObject();

        setState(() {
          sizeOfCurrentWeight = boxCurrentWeight.size;
          deltaOfCurrentWeightSize = sizeOfCurrentWeight.width / 2;

          sizeOfChartContainer = boxChartContainer.size;

          sizeOfStartWeight = boxStartWeight.size;
          deltaOfStartWeight = sizeOfStartWeight.width / 2;

          sizeOfEndWeight = boxEndWeight.size;
          deltaOfEndWeight = sizeOfEndWeight.width / 2;

          sizeofCurrentWaist = boxCurrentWaist.size;
          deltaOfCurrentWaistSize = sizeofCurrentWaist.width/2;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Сводная информация"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Прогресс"),
            Text("Вес"),
            buildWeightChart(),
            Text("Объем талии"),
            Container(
              key: chartKeyContainer2,
              child: Stack(
                children: [
                  RotationTransition(
                    turns: new AlwaysStoppedAnimation(270 / 360),
                    child: AnimatedCircularChart(
                      key: _chartWaistGreyKey,
                      size: const Size(200.0, 200.0),
                      initialChartData: <CircularStackEntry>[
                        new CircularStackEntry(
                          <CircularSegmentEntry>[
                            new CircularSegmentEntry(
                              50,
                              Colors.grey[300],
                              rankKey: 'remaining',
                            ),
                          ],
                          rankKey: 'progress',
                        ),
                      ],
                      chartType: CircularChartType.Radial,
                      edgeStyle: SegmentEdgeStyle.round,
                      percentageValues: true,
                    ),
                  ),
                  RotationTransition(
                    turns: new AlwaysStoppedAnimation(270 / 360),
                    child: AnimatedCircularChart(
                      key: _chartWaistRedKey,
                      size: const Size(200.0, 200.0),
                      initialChartData: <CircularStackEntry>[
                        new CircularStackEntry(
                          <CircularSegmentEntry>[
                            new CircularSegmentEntry(
                              6,
                              Colors.blue[300],
                              rankKey: '1',
                            ),
                          ],
                          rankKey: '2',
                        ),
                      ],
                      chartType: CircularChartType.Radial,
                      edgeStyle: SegmentEdgeStyle.round,
                      percentageValues: true,
                    ),
                  ),
                  Positioned(
                    key: currentWaistKey ,
                    top: sizeOfChartContainer.height / 4,
                    left: sizeOfChartContainer.width / 2 - deltaOfCurrentWaistSize,
                    child: Column(
                      children: [
                        Text(
                          "102",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("-10 cм"),
                      ],
                    ),
                  ),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildWeightChart() {
    return Container(
      key: chartKeyContainer,
      child: Stack(
        children: [
          RotationTransition(
            turns: new AlwaysStoppedAnimation(270 / 360),
            child: AnimatedCircularChart(
              key: _chartWeightGreyKey,
              size: const Size(200.0, 200.0),
              initialChartData: <CircularStackEntry>[
                new CircularStackEntry(
                  <CircularSegmentEntry>[
                    new CircularSegmentEntry(
                      50,
                      Colors.grey[300],
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
              ],
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              percentageValues: true,
            ),
          ),
          RotationTransition(
            turns: new AlwaysStoppedAnimation(270 / 360),
            child: AnimatedCircularChart(
              key: _chartWeightBlueKey,
              size: const Size(200.0, 200.0),
              initialChartData: <CircularStackEntry>[
                new CircularStackEntry(
                  <CircularSegmentEntry>[
                    new CircularSegmentEntry(
                      11.3,
                      Colors.red[300],
                      rankKey: '1',
                    ),
                  ],
                  rankKey: '2',
                ),
              ],
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              percentageValues: true,
            ),
          ),
          Positioned(
            key: currentWeightKey,
            top: sizeOfChartContainer.height / 4,
            left: sizeOfChartContainer.width / 2 - deltaOfCurrentWeightSize,
            child: Column(
              children: [
                Text(
                  "102",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("-10 кг"),
              ],
            ),
          ),
          Positioned(
            key: startWeightKey,
            top: sizeOfChartContainer.height / 2 + 7,
            left: 17 - deltaOfStartWeight / 2,
            child: Text(
              "120",
            ),
          ),
          Positioned(
            key: endWeightKey,
            top: sizeOfChartContainer.height / 2 + 7,
            right: 13,
            child: Text("90"),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:weight_control/model/weight/weight_mobx.dart';
import 'package:weight_control/model/weight/weight_model.dart';
import 'package:weight_control/screens/tabs/addingPage/adding-page-mobx.dart';

class AddingValuesPage extends StatefulWidget {
  // static Future<void> show(BuildContext context) async {
  //   await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => AddingValuesPage(),
  //       fullscreenDialog: true,
  //     ),
  //   );
  // }

  @override
  _AddingValuesPageState createState() => _AddingValuesPageState();
}

class _AddingValuesPageState extends State<AddingValuesPage> {
  final weightController = TextEditingController();

  final mobxCheck = AddingPageMobx();
  final mobxWeight = WeightMobx();

  final weightTextFieldKey = GlobalKey();
  final waisteTextFieldKey = GlobalKey();
  Size sizeWeightTextFieldKey = Size(0, 0);
  Size sizeWaisteTextFieldKey = Size(0, 0);

  void calculateSizes() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox boxWeightTextFieldKey =
          weightTextFieldKey.currentContext.findRenderObject();
      final RenderBox boxWaisteTextFieldKey =
          waisteTextFieldKey.currentContext.findRenderObject();

      setState(() {
        sizeWeightTextFieldKey = boxWeightTextFieldKey.size;
        sizeWaisteTextFieldKey = boxWaisteTextFieldKey.size;
      });
    });
  }

  void addWeight(double value) {
    mobxCheck.addWeight(value);
    mobxWeight.updateCurrentWeight();
  }

  @override
  void initState() {
    calculateSizes();
    super.initState();
  }

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<WeightModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32, top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text("Введите новые показатели"),
                  buildCheckBoxAndTextField(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: sizeWaisteTextFieldKey.height,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Observer(
                            builder: (_) => IconButton(
                              icon: mobxCheck.isWaisteChecked
                                  ? Icon(
                                      Boxicons.bxs_minus_square,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Boxicons.bxs_plus_square,
                                      color: Colors.green,
                                    ),
                              onPressed: () {
                                mobxCheck.changeWaiste();
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Observer(
                            builder: (_) => TextField(
                              onChanged: (text) => print(text),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"^\d+\.?\d{0,2}"))
                              ],
                              keyboardType: TextInputType.number,
                              key: waisteTextFieldKey,
                              decoration: InputDecoration(
                                focusColor: Colors.blue,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true,
                                hintText: 'Объем талии',
                                enabled:
                                    mobxCheck.isWaisteChecked ? true : false,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Observer(
                    builder: (_) => OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        elevation: 4,
                        primary: Colors.white,
                        backgroundColor: Colors.redAccent,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        addWeight(double.parse(weightController.text));
                        Navigator.of(context).pop(true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 32.0,
                          right: 32,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Text(
                          "Добавить",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCheckBoxAndTextField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: sizeWeightTextFieldKey.height,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Observer(
              builder: (_) => IconButton(
                icon: mobxCheck.isWeightChecked
                    ? Icon(
                        Boxicons.bxs_minus_square,
                        color: Colors.red,
                      )
                    : Icon(
                        Boxicons.bxs_plus_square,
                        color: Colors.green,
                      ),
                onPressed: () {
                  mobxCheck.changeWeight();
                },
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Observer(
              builder: (_) => TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}"))
                ],
                controller: weightController,
                keyboardType: TextInputType.number,
                key: weightTextFieldKey,
                decoration: InputDecoration(
                  focusColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                  hintText: 'Вес',
                  enabled: mobxCheck.isWeightChecked ? true : false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

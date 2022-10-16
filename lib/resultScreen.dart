// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';
import 'globals.dart' as globals;

class PMI_Score_Screen extends StatelessWidget {
  final double pmiRes;
  final int Age;
  String? status;
  String? advice;
  Color? statusColor;

  PMI_Score_Screen({
    Key? key,
    required this.pmiRes,
    required this.Age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkStatus();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('PMI Score'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Your Score",
                style: TextStyle(fontSize: 32, color: Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              PrettyGauge(
                maxValue: 40.0,
                minValue: 0.0,

                segments: [
                  GaugeSegment("Under weight", 18, Colors.red),
                  GaugeSegment("Normal", 7, Colors.green),
                  GaugeSegment("Over weight", 5, Colors.orange),
                  GaugeSegment("Obese", 10, Colors.pink)
                ],
                gaugeSize: 350,
                valueWidget: Text(
                  pmiRes.toStringAsFixed(1),
                  style: TextStyle(fontSize: 32),
                ), //num of fractions
                currentValue: pmiRes.toDouble(),
                needleColor: Colors.blue,
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    status!,
                    style: TextStyle(fontSize: 26, color: statusColor!),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    advice!,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Re-Calculate"),
                      ),
                      SizedBox(
                        height: 70,
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Share.share(
                              "Your PMI is ${pmiRes.toStringAsFixed(1)} at age of ${globals.age.toString()}");
                        },
                        child: Text("Share"),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkStatus() {
    if (pmiRes < 18) {
      status = "Under Weight";
      advice = "You have to increase your weight";
      statusColor = Colors.red;
    } else if (pmiRes >= 18 && pmiRes < 25) {
      status = "Normal";
      advice = "Enjoy, you are fit";
      statusColor = Colors.green;
    } else if (pmiRes >= 25 && pmiRes <= 30) {
      advice = "You have to lose weight";
      statusColor = Colors.orange;
    } else {
      status = "Obese";
      advice = "You have to work hardly to lose weight";
      statusColor = Colors.pink;
    }
  }
}

import 'dart:developer';
import 'dart:math';
import 'package:page_transition/page_transition.dart';
import 'package:project1_pmi_calculater/resultScreen.dart';

import 'globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project1_pmi_calculater/age_weight_widget.dart';
import 'package:project1_pmi_calculater/gender_widget.dart';
import 'package:project1_pmi_calculater/height_widget.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _Finished = false;
  double PMI = 0;

  void CalcPmi() {
    PMI = globals.weightValue / pow(globals.hieght / 100, 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("PMI Calculateor"),
          centerTitle: true,
        ),
        body: Container(
            height: 1000,
            padding: EdgeInsets.all(7),
            child: Card(
                //elevation: 10, //shadow
                child: Column(children: [
              GenderWidget(),
              SizedBox(
                height: 10,
              ),
              Height_Widget(),
              SizedBox(
                height: 10,
              ),
              Weight_Age_widget(),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 270,
                child: SwipeableButtonView(
                    isFinished: _Finished,
                    onFinish: () async {
                      await Navigator.push(
                          context,
                          PageTransition(
                              child: PMI_Score_Screen(
                                  pmiRes: PMI, Age: globals.age),
                              type: PageTransitionType.fade));
                      setState(() {
                        _Finished = false;
                      });
                    },
                    onWaitingProcess: () {
                      CalcPmi();

                      Future.delayed(Duration(seconds: 1), () {
                        setState(() {
                          _Finished = true;
                        });
                      });
                    },
                    activeColor: Colors.blue,
                    buttonWidget: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                    buttonText: "CALCULATE"),
              ),
            ]))));
  }
}

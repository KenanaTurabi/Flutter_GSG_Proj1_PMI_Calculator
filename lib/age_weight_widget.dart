import 'dart:math';
import 'globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1_pmi_calculater/valueController.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import 'height_widget.dart';

class Weight_Age_widget extends GetView<ValueController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ValueController());
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: 180,
              width: 180,
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 30,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: TextStyle(
                              color: Colors.grey[500]!,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 27,
                                width: 27,
                                child: SizedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      if (controller.age > 1)
                                        controller.subAge();

                                      setState() {
                                        globals.age = controller.age as int;
                                      }
                                    },
                                    backgroundColor: Colors.blue,
                                    child: Center(
                                        child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                //width: 10,
                                //height: 10,
                                child: Center(
                                  child: SizedBox(
                                    width: 35,
                                    child: Center(
                                      child: Obx(
                                        () => Text(
                                          ' ${controller.age}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 27,
                                width: 27,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    if (controller.age < 120)
                                      controller.addAge();

                                    setState() {
                                      globals.age = controller.age as int;
                                    }
                                  },
                                  backgroundColor: Colors.blue,
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              )
                            ]),
                      ],
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 180,
              width: 180,
              child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 30,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Weight(Kg)",
                          style: TextStyle(
                              color: Colors.grey[500]!,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 27,
                                width: 27,
                                child: SizedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      if (controller.Weight > 1)
                                        controller.subWeight();
                                      setState() {
                                        globals.weightValue =
                                            controller.Weight as int;
                                      }
                                    },
                                    backgroundColor: Colors.blue,
                                    child: Center(
                                        child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                //width: 10,
                                //height: 10,
                                child: Center(
                                  child: SizedBox(
                                    width: 35,
                                    child: Center(
                                      child: Obx(
                                        () => Text(
                                          ' ${controller.Weight}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 27,
                                width: 27,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    if (controller.Weight < 500)
                                      controller.addWeight();
                                    setState() {
                                      globals.weightValue =
                                          controller.Weight as int;
                                    }
                                  },
                                  backgroundColor: Colors.blue,
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )),
                                ),
                              )
                            ]),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  } //build func

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class Height_Widget extends StatefulWidget {
  @override
  State<Height_Widget> createState() => _HeightState();
}

class _HeightState extends State<Height_Widget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(20),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(
              "Height",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  globals.hieght.toString(),
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "cm",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Slider(
                thumbColor: Colors.red,
                min: 0,
                max: 240,
                value: globals.hieght.toDouble(),
                onChanged: (value) {
                  setState(() {
                    globals.hieght = value.toInt();
                  });
                }),
          ],
        ),
      ),
    );
  }
}

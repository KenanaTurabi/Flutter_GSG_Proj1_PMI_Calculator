import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  ChoiceChip3DStyle unselectedStyle = ChoiceChip3DStyle(
      borderRadius: BorderRadius.circular(20),
      topColor: Colors.white,
      backColor: Colors.grey[300]!);
  ChoiceChip3DStyle selectedStyle = ChoiceChip3DStyle(
      borderRadius: BorderRadius.circular(20),
      backColor: Colors.grey,
      topColor: Colors.grey[200]!);

  int gender = 0;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(2),
        child: ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: gender == 1 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                gender = 1;
              });
            },
            onUnSelected: () {},
            selected: gender == 1,
            child: Column(
              children: [
                Container(
                  height: 40,
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                    "images/man.png",
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Male",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            )),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(2),
        child: ChoiceChip3D(
            border: Border.all(color: Colors.grey),
            style: gender == 2 ? selectedStyle : unselectedStyle,
            onSelected: () {
              setState(() {
                gender = 2;
              });
            },
            selected: gender == 2,
            onUnSelected: () {},
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Image.asset(
                    "images/woman.png",
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Female",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            )),
      ),
    ]);
  }
}

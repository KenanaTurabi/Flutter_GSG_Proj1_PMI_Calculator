import 'package:get/get.dart';

class ValueController extends GetxController {
  RxInt Weight = 50.obs;
  RxInt age = 30.obs;

  void addWeight() {
    Weight++;
  }

  void subWeight() {
    Weight--;
  }

  void addAge() {
    age++;
  }

  void subAge() {
    age--;
  }
}

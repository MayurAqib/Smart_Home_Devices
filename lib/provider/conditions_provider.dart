import 'package:flutter/material.dart';

class ConditionsProvider extends ChangeNotifier {
  bool isSelectTemp = true;
  bool isSelectStats = false;
  bool isSelectHeating = true;
  bool isSelectCooling = false;
  bool isSelectAirwave = false;
  bool devicePower = true;

  double temp = 22;
  void selectTemp() {
    isSelectStats = false;
    isSelectTemp = true;

    notifyListeners();
  }

  void selectStats() {
    isSelectStats = true;
    isSelectTemp = false;

    notifyListeners();
  }

  void selectHeating() {
    isSelectHeating = true;
    isSelectCooling = false;
    isSelectAirwave = false;
    temp = 22;
    notifyListeners();
  }

  void selectCooling() {
    isSelectHeating = false;
    isSelectCooling = true;
    isSelectAirwave = false;
    temp = 18;
    notifyListeners();
  }

  void selectAirwave() {
    isSelectHeating = false;
    isSelectCooling = false;
    isSelectAirwave = true;
    temp = 20;
    notifyListeners();
  }

  void toggleDevicePower() {
    devicePower = !devicePower;
    notifyListeners();
  }
}

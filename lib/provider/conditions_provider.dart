import 'package:flutter/material.dart';

class ConditionsProvider extends ChangeNotifier {
  bool isSelectTemp = true;
  bool isSelectStats = false;
  bool isSelectHeating = true;
  bool isSelectCooling = false;
  bool isSelectAirwave = false;
  bool devicePower = true;
  double temp = 22;

  //todo: SELECT TEMPERATURE TILE
  void selectTemp() {
    isSelectStats = false;
    isSelectTemp = true;
    notifyListeners();
  }

  //todo: SELECT STATISTICS TILE
  void selectStats() {
    isSelectStats = true;
    isSelectTemp = false;
    notifyListeners();
  }

  //todo: SELECT HEATING TILE
  void selectHeating() {
    isSelectHeating = true;
    isSelectCooling = false;
    isSelectAirwave = false;
    temp = 22;
    notifyListeners();
  }

  //todo: SELECT COOLING TILE
  void selectCooling() {
    isSelectHeating = false;
    isSelectCooling = true;
    isSelectAirwave = false;
    temp = 18;
    notifyListeners();
  }

  //todo: SELECT AIRWAVE TILE
  void selectAirwave() {
    isSelectHeating = false;
    isSelectCooling = false;
    isSelectAirwave = true;
    temp = 20;
    notifyListeners();
  }

  //todo: POWER SWITCH
  void toggleDevicePower() {
    devicePower = !devicePower;
    notifyListeners();
  }
}

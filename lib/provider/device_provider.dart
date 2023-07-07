import 'package:flutter/material.dart';
import 'package:home_devices/provider/device_model.dart';

class DeviceProvider extends ChangeNotifier {
  static List<DeviceModel> smartDevices = [
    DeviceModel(
        deviceName: 'Smart Light',
        deviceUrl: 'https://cdn-icons-png.flaticon.com/128/10847/10847857.png',
        power: true),
    DeviceModel(
        deviceName: 'Smart AC',
        deviceUrl: 'https://cdn-icons-png.flaticon.com/128/4279/4279226.png',
        power: false),
    DeviceModel(
        deviceName: 'Smart TV',
        deviceUrl: 'https://cdn-icons-png.flaticon.com/128/2627/2627288.png',
        power: false),
    DeviceModel(
        deviceName: 'Smart Fan',
        deviceUrl: 'https://cdn-icons-png.flaticon.com/128/9912/9912869.png',
        power: false),
  ];

  List<DeviceModel> smartDeviceList() {
    return smartDevices;
  }
}

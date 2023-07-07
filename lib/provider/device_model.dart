class DeviceModel {
  final String deviceName;
  final String deviceUrl;
  bool power;

  DeviceModel(
      {required this.deviceName, required this.deviceUrl, required this.power});

  void togglePower() {
    power = !power;
  }
}

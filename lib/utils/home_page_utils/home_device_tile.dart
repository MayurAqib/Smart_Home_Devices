import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_devices/provider/device_model.dart';
import 'package:home_devices/utils/colors.dart';

class HomeDeviceTile extends StatelessWidget {
  final DeviceModel device;
  final void Function(bool) onChanged;
  const HomeDeviceTile(
      {super.key, required this.device, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: device.power ? Colors.black : background.withOpacity(0.8)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                device.deviceUrl,
                height: 50,
                color: device.power ? homeBackground : dark,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      device.deviceName,
                      style: TextStyle(
                          color: device.power ? homeBackground : dark,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Transform.rotate(
                    angle: -90 * 3.14 / 180,
                    child: CupertinoSwitch(
                      activeColor: homeBackground,
                      trackColor: Colors.grey.shade300,
                      thumbColor: device.power ? Colors.black : Colors.white,
                      value: device.power,
                      onChanged: onChanged,
                    ),
                  )
                ],
              )
            ]));
  }
}

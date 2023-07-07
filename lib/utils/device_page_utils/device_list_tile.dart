import 'package:flutter/material.dart';
import 'package:home_devices/provider/device_model.dart';
import 'package:home_devices/utils/colors.dart';

class DeviceListTile extends StatelessWidget {
  final DeviceModel device;
  final void Function(bool) onChanged;
  const DeviceListTile(
      {super.key, required this.device, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: switchBackground))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                device.power
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        decoration: BoxDecoration(
                            color: dark,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            Image.network(
                              device.deviceUrl,
                              height: 45,
                              color: homeBackground,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '2',
                              style: TextStyle(
                                  color: homeBackground,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          ],
                        ))
                    : Image.network(
                        device.deviceUrl,
                        height: 60,
                      ),
                const SizedBox(
                  width: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      device.power ? 'Connected' : 'Not Connected',
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      device.deviceName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    if (device.power == true)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                  color: switchBackground.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Text(
                                'Bedroom',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                  color: switchBackground.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Text(
                                'Livingroom',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ],
            ),
            Switch(
              value: device.power,
              trackOutlineColor:
                  const MaterialStatePropertyAll(Colors.transparent),
              thumbColor: const MaterialStatePropertyAll(homeBackground),
              trackColor: MaterialStatePropertyAll(
                  device.power ? dark : switchBackground.withOpacity(0.6)),
              onChanged: onChanged,
            )
          ],
        ));
  }
}

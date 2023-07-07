import 'package:flutter/material.dart';

import 'package:home_devices/provider/device_provider.dart';
import 'package:home_devices/pages/home_page.dart';
import 'package:home_devices/utils/colors.dart';
import 'package:home_devices/utils/device_page_utils/device_list_tile.dart';
import 'package:provider/provider.dart';

import '../provider/conditions_provider.dart';

class DevicesPage extends StatelessWidget {
  const DevicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final condition = Provider.of<ConditionsProvider>(context);
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                        )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Devices',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        Text(
                          'Connected',
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          condition.devicePower ? 'On' : 'Off',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: condition.toggleDevicePower,
                          child: CircleAvatar(
                            backgroundColor:
                                condition.devicePower ? dark : switchBackground,
                            radius: 17,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                if (condition.devicePower == false) const SizedBox(height: 630),
                if (condition.devicePower == true)
                  Consumer<DeviceProvider>(builder: (context, value, child) {
                    return SizedBox(
                      height: 630,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.smartDeviceList.length,
                        itemBuilder: (context, index) {
                          final device = value.smartDeviceList[index];
                          return DeviceListTile(
                            device: device,
                            onChanged: (values) {
                              value.toggleDevicePower(index);
                            },
                          );
                        },
                      ),
                    );
                  })
              ],
            ),
          ),
        ),
      )),
    );
  }
}

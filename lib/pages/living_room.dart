import 'package:flutter/material.dart';
import 'package:home_devices/provider/conditions_provider.dart';
import 'package:home_devices/pages/home_page.dart';
import 'package:home_devices/utils/colors.dart';
import 'package:home_devices/utils/living_room_utils/container_tile.dart';
import 'package:home_devices/utils/living_room_utils/statistics.dart';
import 'package:home_devices/utils/living_room_utils/temperature_details.dart';
import 'package:provider/provider.dart';

class LivingRoom extends StatefulWidget {
  const LivingRoom({super.key});

  @override
  State<LivingRoom> createState() => _LivingRoomState();
}

class _LivingRoomState extends State<LivingRoom> {
  @override
  Widget build(BuildContext context) {
    final conditions = Provider.of<ConditionsProvider>(context);
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
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
                    const Column(
                      children: [
                        Text(
                          'Temperature',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 22),
                        ),
                        SizedBox(height: 5),
                        Text('Living Room'),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerTile(
                        isSelect: conditions.isSelectTemp,
                        onTap: conditions.selectTemp,
                        title: 'Temperature',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/128/1843/1843544.png'),
                    ContainerTile(
                        isSelect: conditions.isSelectStats,
                        onTap: conditions.selectStats,
                        title: 'Statistics',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/128/9685/9685121.png')
                  ],
                ),
                if (conditions.isSelectTemp == true) const TemperatureDetails(),
                if (conditions.isSelectStats == true) const Statistics()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

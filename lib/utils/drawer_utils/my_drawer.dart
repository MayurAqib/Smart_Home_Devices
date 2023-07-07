import 'package:flutter/material.dart';
import 'package:home_devices/pages/devices_page.dart';
import 'package:home_devices/pages/living_room.dart';
import 'package:home_devices/utils/colors.dart';
import 'package:home_devices/utils/drawer_utils/drawer_row.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: dark,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/128/2948/2948319.png',
                      color: switchBackground,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'SMART HOME',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: homeBackground, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      color: switchBackground,
                    ),
                    const SizedBox(height: 40),
                    const DrawerRow(
                        page: 'D E V I C E S',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/128/8017/8017722.png',
                        navigateTo: DevicesPage()),
                    const DrawerRow(
                        page: 'L I V I N G  R O O M',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/128/4804/4804672.png',
                        navigateTo: LivingRoom())
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

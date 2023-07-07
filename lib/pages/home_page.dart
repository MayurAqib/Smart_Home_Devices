import 'package:flutter/material.dart';
import 'package:home_devices/provider/device_provider.dart';
import 'package:home_devices/utils/colors.dart';
import 'package:home_devices/utils/home_page_utils/home_device_tile.dart';
import 'package:home_devices/utils/drawer_utils/my_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const MyDrawer(),
      backgroundColor: homeBackground,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!.openDrawer();
                        },
                        child: Image.network(
                          'https://cdn-icons-png.flaticon.com/128/10289/10289962.png',
                          height: 30,
                        ),
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: background,
                        backgroundImage: NetworkImage(
                            'https://scontent-del1-2.xx.fbcdn.net/v/t39.30808-6/330866177_600720168560779_2843717111264543370_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=L6DB3xo5wWEAX_YBBRj&_nc_ht=scontent-del1-2.xx&oh=00_AfDdLe9JsOhHrFYcJ8CslwmM6JxrJrNqeo7351rjv2YlUA&oe=64AA99E4'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome Home',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Garret Reynolds',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w900),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Image.network(
                          // 'https://cdn-icons-png.flaticon.com/128/5098/5098099.png',
                          'https://cdn-icons-png.flaticon.com/128/2922/2922437.png',
                          height: 130,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Smart Devices',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Consumer<DeviceProvider>(
                      builder: (context, value, child) => GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.smartDeviceList().length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1 / 1.4),
                          itemBuilder: (context, index) {
                            final device = value.smartDeviceList()[index];
                            return HomeDeviceTile(
                              device: value.smartDeviceList()[index],
                              onChanged: (value) {
                                setState(() {
                                  device.togglePower();
                                });
                              },
                            );
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

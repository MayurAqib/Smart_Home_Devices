import 'package:flutter/material.dart';
import 'package:home_devices/provider/conditions_provider.dart';
import 'package:home_devices/provider/device_provider.dart';
import 'package:home_devices/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DeviceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ConditionsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

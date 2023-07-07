import 'package:flutter/material.dart';
import 'package:home_devices/utils/colors.dart';

class CoolingTile extends StatelessWidget {
  const CoolingTile(
      {super.key,
      required this.title,
      required this.temp,
      this.icon,
      required this.onTap,
      required this.isSelect});
  final String title;
  final String temp;
  final IconData? icon;
  final bool isSelect;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isSelect ? dark : homeBackground),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(color: switchBackground),
                ),
                Icon(
                  icon,
                  size: 4,
                  color: isSelect ? homeBackground : dark,
                )
              ],
            ),
            Row(
              children: [
                Text(
                  temp,
                  style: TextStyle(
                      color: isSelect ? homeBackground : dark,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

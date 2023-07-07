import 'package:flutter/material.dart';
import 'package:home_devices/utils/colors.dart';

class ContainerTile extends StatelessWidget {
  const ContainerTile(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.isSelect,
      required this.onTap});
  final void Function() onTap;
  final String title;
  final String imageUrl;
  final bool isSelect;
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final width = deviceWidth / 2 - 40;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: isSelect ? Colors.black : Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              height: 20,
              color: isSelect ? homeBackground : dark,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: isSelect ? homeBackground : dark,
                fontWeight: isSelect ? FontWeight.normal : FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:home_devices/utils/colors.dart';

class DrawerRow extends StatelessWidget {
  const DrawerRow(
      {super.key,
      required this.imageUrl,
      required this.navigateTo,
      required this.page});
  final String page;
  final String imageUrl;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigateTo));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network(
              imageUrl,
              height: 40,
              color: switchBackground.withOpacity(0.7),
            ),
            const SizedBox(width: 20),
            Text(
              page,
              style: TextStyle(
                color: homeBackground,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}

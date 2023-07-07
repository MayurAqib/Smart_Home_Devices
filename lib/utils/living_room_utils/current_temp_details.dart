import 'package:flutter/material.dart';

class CurrentTempDetails extends StatelessWidget {
  const CurrentTempDetails(
      {super.key,
      required this.value,
      required this.condition,
      required this.iconUrl,
      required this.color,
      required this.crossAxisAlignment});
  final String value;
  final String condition;
  final String iconUrl;
  final Color color;
  final CrossAxisAlignment crossAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          condition,
          style: TextStyle(
              color: Colors.grey.shade700, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Image.network(
              iconUrl,
              color: color,
              height: 10,
            ),
            const SizedBox(width: 5),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            )
          ],
        )
      ],
    );
  }
}

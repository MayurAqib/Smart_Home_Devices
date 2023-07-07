import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 100,
        // ),
        Container(
          height: 600,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: homeBackground,
              image: const DecorationImage(
                  // image: AssetImage('lib/img/analysis.png')
                  image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/128/5961/5961425.png'))),
        )
      ],
    );
  }
}

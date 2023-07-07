import 'package:flutter/material.dart';
import 'package:home_devices/utils/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class TemperatureMeter extends StatelessWidget {
  const TemperatureMeter({
    super.key,
    required this.value,
    required this.temp,
  });
  final double value;
  final String temp;

  @override
  Widget build(BuildContext context) {
    final tempValue = value.toInt();
    return Stack(
      children: [
        const SizedBox(
          height: 340,
        ),
        SfRadialGauge(
          axes: [
            RadialAxis(
              showAxisLine: false,
              ticksPosition: ElementsPosition.outside,
              majorTickStyle:
                  const MajorTickStyle(color: dark, thickness: 3, length: 10),
              minorTickStyle: const MinorTickStyle(color: dark, thickness: 2),
              startAngle: 180,
              endAngle: 360,
              interval: 16,
              showLabels: false,
              showFirstLabel: false,
              canRotateLabels: true,
              minorTicksPerInterval: 15,
              minimum: 14,
              maximum: 30,
              pointers: [
                MarkerPointer(
                  value: value,
                  markerType: MarkerType.circle,
                  color: dark,
                  markerHeight: 5,
                  markerWidth: 5,
                  markerOffset: 35,
                ),
                MarkerPointer(
                  value: value,
                  markerType: MarkerType.triangle,
                  color: dark,
                  markerHeight: 12,
                  markerWidth: 12,
                  markerOffset: 20,
                ),
              ],
              annotations: [
                GaugeAnnotation(
                    widget: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                      shape: BoxShape.circle,
                      color: homeBackground.withOpacity(0.6),
                      boxShadow: [
                        BoxShadow(
                            color: switchBackground.withOpacity(0.07),
                            spreadRadius: 10,
                            blurRadius: 5),
                        BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            spreadRadius: 35),
                        BoxShadow(
                            color: switchBackground.withOpacity(0.05),
                            spreadRadius: 45)
                      ]),
                  child: Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: tempValue.toString(),
                            style: const TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.w900,
                                color: dark)),
                        const TextSpan(
                            text: '\u00B0c',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: dark)),
                      ]),
                    ),
                  ),
                ))
              ],
            ),
          ],
        ),
        Positioned(
            left: 8,
            top: 180,
            child: Text(
              '14\u00B0c',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            )),
        Positioned(
            right: 8,
            top: 180,
            child: Text(
              '30\u00B0c',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                  fontWeight: FontWeight.w900),
            )),
      ],
    );
  }
}

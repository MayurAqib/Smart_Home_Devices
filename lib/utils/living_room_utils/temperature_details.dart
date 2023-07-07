import 'package:flutter/material.dart';
import 'package:home_devices/provider/conditions_provider.dart';
import 'package:home_devices/utils/colors.dart';
import 'package:home_devices/utils/living_room_utils/cooling_tile.dart';
import 'package:home_devices/utils/living_room_utils/current_temp_details.dart';
import 'package:home_devices/utils/living_room_utils/temperature_scale.dart';
import 'package:provider/provider.dart';

class TemperatureDetails extends StatelessWidget {
  const TemperatureDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final conditions = Provider.of<ConditionsProvider>(context);
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        TemperatureMeter(
          temp: conditions.temp.toString(),
          value: conditions.temp,
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CurrentTempDetails(
              crossAxisAlignment: CrossAxisAlignment.start,
              value: '24 \u00B0c',
              color: dark,
              iconUrl:
                  'https://cdn-icons-png.flaticon.com/128/4655/4655143.png',
              condition: 'Current Temp',
            ),
            CurrentTempDetails(
                crossAxisAlignment: CrossAxisAlignment.end,
                value: '54 %',
                condition: 'Current Humidity',
                iconUrl:
                    'https://cdn-icons-png.flaticon.com/128/6364/6364586.png',
                color: switchBackground),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CoolingTile(
              isSelect: conditions.isSelectHeating,
              onTap: conditions.selectHeating,
              title: 'Heating ',
              icon: Icons.circle,
              temp: '22\u00B0c',
            ),
            CoolingTile(
                isSelect: conditions.isSelectCooling,
                onTap: conditions.selectCooling,
                title: 'Cooling ',
                icon: Icons.circle,
                temp: '18\u00B0c'),
            CoolingTile(
                isSelect: conditions.isSelectAirwave,
                onTap: conditions.selectAirwave,
                title: 'Airwave',
                temp: '20\u00B0c'),
          ],
        )
      ],
    );
  }
}

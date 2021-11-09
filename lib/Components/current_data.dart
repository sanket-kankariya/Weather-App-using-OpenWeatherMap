import 'package:digi/functions/functions.dart';
import 'package:flutter/material.dart';

class ShowCurrentData extends StatelessWidget {
  const ShowCurrentData({Key? key, required this.currentdata}) : super(key: key);
  final Map currentdata;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text(getDateTime(currentdata['dt'])),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentdata['temp'].toString(),
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  const Text(
                    "°C",
                  ),
                ],
              ),
              Text(
                currentdata['weather'][0]['description'],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sunrise:',
                ),
                Text(
                  getTime(currentdata['sunrise']) + "AM UTC",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sunset:',
                ),
                Text(
                  getTime(currentdata['sunset']) + "PM UTC",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Pressure:',
                ),
                Text(
                  currentdata['pressure'].toString() + 'hPa',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Humidity:',
                ),
                Text(
                  currentdata['humidity'].toString() + '%',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

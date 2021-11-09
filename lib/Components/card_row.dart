import 'package:digi/functions/functions.dart';
import 'package:flutter/material.dart';

class ShowCardRow extends StatelessWidget {
  const ShowCardRow({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);
  final String title;
  final List data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: data.map((day) {
              Map daydata = day;
              return Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 150,
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getDay(daydata['dt']),
                      ),
                      Text(
                        daydata['temp']['day'].toString() + "°C",
                      ),
                      Image.network(
                        'http://openweathermap.org/img/wn/${daydata['weather'][0]['icon']}.png',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.water),
                          Text(daydata['humidity'].toString() + "%")
                        ],
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

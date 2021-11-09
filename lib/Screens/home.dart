import 'dart:convert';

import 'package:digi/Components/card_row.dart';
import 'package:digi/Components/current_data.dart';
import 'package:digi/Components/googlemaps.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String lat = '40.7';
  String long = '-74';
  String location = '';
  bool isLoading = true;

  Map currentdata = {};
  List dailydata = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&units=metric&appid=1b67b9af69e542598df3a26c7946ccbb'));
    Map apidata = jsonDecode(response.body);
    currentdata = apidata["current"];
    dailydata = apidata['daily'];

    // get current Location
    http.Response loc = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=1b67b9af69e542598df3a26c7946ccbb'));
    Map locdata = jsonDecode(loc.body);
    location = locdata['name'];

    setState(() {
      isLoading = false;
    });
  }

  changeloc() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          children: [
            TextField(
              onChanged: (x) {
                setState(() {
                  lat = x.toString();
                });
              },
              decoration: const InputDecoration(label: Text("Enter Latitude")),
            ),
            TextField(
              onChanged: (x) {
                setState(() {
                  long = x.toString();
                });
              },
              decoration: const InputDecoration(label: Text("Enter Longitude")),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  getData();
                  Navigator.pop(context);
                });
              },
              child: const Text("Done"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("My Weather App"),
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://images.pexels.com/photos/4737484/pexels-photo-4737484.jpeg?cs=srgb&dl=pexels-rafael-cerqueira-4737484.jpg&fm=jpg',
                      ),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      ListTile(
                        onTap: changeloc,
                        leading: const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                        ),
                        title: Text(
                          location,
                        ),
                      ),
                      ShowCurrentData(currentdata: currentdata),
                      const SizedBox(
                        height: 20,
                      ),
                      ShowCardRow(
                          title: "Forecast for Upcoming days >",
                          data: dailydata),
                      const SizedBox(
                        height: 10,
                      ),
                      ShowMap(lat: lat, long: long),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

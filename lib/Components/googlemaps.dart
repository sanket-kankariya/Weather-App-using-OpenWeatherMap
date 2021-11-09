import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatelessWidget {
  ShowMap({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);
  final String lat;
  final String long;
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: {
          Marker(
              markerId: const MarkerId('address'),
              position: LatLng(double.parse(lat), double.parse(long)))
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(double.parse(lat), double.parse(long)),
          zoom: 11.0,
        ),
      ),
    );
  }
}

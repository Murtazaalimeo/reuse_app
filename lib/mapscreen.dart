import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;

  final LatLng _center = LatLng(30.3753, 69.3451);

  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('recycle1'),
      position: LatLng(24.8607, 67.0011), // Karachi
      infoWindow: InfoWindow(
        title: 'Karachi Recycle Center',
        snippet: 'A major recycling center in Karachi',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('recycle2'),
      position: LatLng(31.5204, 74.3587), // Lahore
      infoWindow: InfoWindow(
        title: 'Lahore Recycle Center',
        snippet: 'A major recycling center in Lahore',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('recycle3'),
      position: LatLng(33.6844, 73.0479), // Islamabad
      infoWindow: InfoWindow(
        title: 'Islamabad Recycle Center',
        snippet: 'A major recycling center in Islamabad',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
    Marker(
      markerId: MarkerId('recycle4'),
      position: LatLng(34.0151, 71.5249), // Peshawar
      infoWindow: InfoWindow(
        title: 'Peshawar Recycle Center',
        snippet: 'A major recycling center in Peshawar',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycle Centers in Pakistan'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 6,
        ),
        markers: _markers,
      ),
    );
  }
}

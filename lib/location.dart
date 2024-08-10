import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geolocator/geolocator.dart';

class UserMapInfo extends StatefulWidget {
  const UserMapInfo({Key? key}) : super(key: key);

  @override
  State<UserMapInfo> createState() => _UserMapInfoState();
}

class _UserMapInfoState extends State<UserMapInfo> {
  late GoogleMapController mapController;

  late LatLng _currentPosition;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    double lat = position.latitude;
    double long = position.longitude;

    LatLng location = LatLng(lat, long);

    setState(() {
      _currentPosition = location;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 16.0,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationMapWidget extends StatefulWidget {
//   @override
//   _LocationMapWidgetState createState() => _LocationMapWidgetState();
// }

// class _LocationMapWidgetState extends State<LocationMapWidget> {
//   Position? _currentPosition;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         _currentPosition = position;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Map'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_currentPosition != null)
//               Text(
//                 'Latitude: ${_currentPosition!.latitude}\n'
//                 'Longitude: ${_currentPosition!.longitude}',
//                 style: TextStyle(fontSize: 18),
//                 textAlign: TextAlign.center,
//               )
//             else
//               CircularProgressIndicator(),
//             // Add map widget here
//           ],

//         ),
//       ),

//     );

//   }
// }

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LiveLocationView extends StatefulWidget {
//   @override
//   _LiveLocationViewState createState() => _LiveLocationViewState();
// }

// class _LiveLocationViewState extends State<LiveLocationView> {
//   late GoogleMapController mapController;
//   Position? currentPosition;

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Live Location View'),
//       ),
//       body: currentPosition != null
//           ? GoogleMap(
//               onMapCreated: _onMapCreated,
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(
//                   currentPosition!.latitude,
//                   currentPosition!.longitude,
//                 ),
//                 zoom: 15.0,
//               ),
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//               compassEnabled: true,
//               markers: Set<Marker>.from([
//                 Marker(
//                   markerId: MarkerId('current_location'),
//                   position: LatLng(
//                     currentPosition!.latitude,
//                     currentPosition!.longitude,
//                   ),
//                 ),
//               ]),
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }

//   void _getCurrentLocation() async {
//     final position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );

//     setState(() {
//       currentPosition = position;
//     });
//   }
// }

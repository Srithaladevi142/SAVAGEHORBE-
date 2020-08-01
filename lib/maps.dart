// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapsPage extends StatefulWidget {
//   @override
//   _MapsPageState createState() => _MapsPageState();
// }

// class _MapsPageState extends State<MapsPage> {
//   Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
//   Marker marker =
//       Marker(markerId: MarkerId('abc'), position: LatLng(11.11111, 77.777777));

//       CameraPosition cameraPosition = CameraPosition(target: LatLng(11.11111, 77.777777));

//   var l;
//   getCurrentLoc() async {
//     Location loc = new Location();
//     l = await loc.getLocation();

//     setState(() {
//       marker = Marker(
//           markerId: MarkerId('abc'), position: LatLng(l.latitude, l.longitude));
// cameraPosition=  CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 11);

//     });
//   }

//   @override
//   void initState() {
//     // getCurrentLoc();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     markers[marker.markerId] = marker;

//     return Scaffold(
//       body: GoogleMap(
//         myLocationButtonEnabled: true,
//         myLocationEnabled: true,
//         mapType: MapType.normal,

//         onTap: (LatLng latLng) async {},
//         initialCameraPosition:
//             cameraPosition,zoomGesturesEnabled: true,
//         markers: Set<Marker>.of(markers.values),
//       ),
//     );
//   }
// }

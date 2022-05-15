import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'colours.dart' as color;

class mapLocations extends StatefulWidget {
  const mapLocations({Key? key}) : super(key: key);

  @override
  State<mapLocations> createState() => _mapLocationsState();
}

class _mapLocationsState extends State<mapLocations> {
  //google maps connection

  late GoogleMapController googleMapsController;
  static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(-13.957826367617761, 33.77469869117725), zoom: 14);


  final Set<Marker> markers = new Set(); //markers for google map

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: color.AppColor.homePageBackground,
          elevation: 0,
          leading: IconButton(
            color: color.AppColor.homePageSubtitle,
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title: Text('Hospital Location',
              style: GoogleFonts.getFont('Barlow Semi Condensed',
                  textStyle: TextStyle(
                    fontSize: 25,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w600,
                  )
              ),
          ),
        ),
      backgroundColor: color.AppColor.homePageBackground,
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        myLocationEnabled: true,
        markers: _getmarkers(),
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller){
          googleMapsController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async{
            Position position = await _determinePosition();
            googleMapsController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 15)));
          },
          label: Text(
            'Current Location',
            style: GoogleFonts.getFont('Barlow Semi Condensed',
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: color.AppColor.homePageTitle,
                    fontWeight: FontWeight.w600,
                )
            ),
          ),
      ),
    );
  }

  //A function to check if the user has given location services permission on the phone
  //and to prompt use to give permission if no permission is given
  Future<Position> _determinePosition () async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error('Location permission disabled');
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
  Set<Marker> _getmarkers() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-13.927335850378755,33.786562531886965), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Area 30 health Clinic ',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-15.781826197378637, 35.00337778651211), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Blantyre Adventist Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-16.06820120075893, 35.147837607405116), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Thyolo District Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
            markerId: MarkerId(initialCameraPosition.toString()),
            position: LatLng(-13.941103395808193, 33.78054553948031), //position of marker
            infoWindow: InfoWindow( //popup info
              title: 'Area 18 health clinic ',
              snippet: '',
            ),
            icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-15.777674977007301, 35.03959079717485), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Ndirande health clinic',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-13.927335850378755, 33.786562531886965), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Area 25 health clinic',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-15.682107952588675, 34.970312267681074), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Chileka health clinic',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-15.81665269431253, 35.0522796405351), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Limbe health centre',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-14.002503541857749, 33.791083456131595), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Biwi health clinic',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-13.976297625352338, 33.786275650931856), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Kamuzu Central Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-13.954598152471553, 33.77937451948531), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Seventh Day Adventist Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-15.802996145102222, 35.02155055162706), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Queen Elizabeth Central Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-13.991500584265005, 33.79766986256541), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Kawale Health Clinic',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-14.026940226132508, 33.70964112209426), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Likuni Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-13.875869945927652, 33.80871350675148), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Deayang Luke Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-14.016481616868285, 33.787744949080334), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'partners in Hope Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-13.95623627580354, 33.783437664338905), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'City Centre Clinic',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-15.987334038022416, 35.07694084231138), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'Thunga Parish Hospital',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
      markers.add(Marker(
        markerId: MarkerId(initialCameraPosition.toString()),
        position: LatLng(-15.801737970604053, 35.0164106846347), //position of marker
        infoWindow: InfoWindow( //popup info
          title: 'College of Medicine',
          snippet: '',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

    });

    return markers;
  }
}

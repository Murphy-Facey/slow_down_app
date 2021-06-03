import "package:flutter/material.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:flutter_native_timezone/flutter_native_timezone.dart";
import "package:timezone/data/latest.dart" as tz;
import "package:timezone/timezone.dart" as tz;
import "package:flutter_geofence/geofence.dart";

class GeoScreen extends StatefulWidget{
  @override
  _GeoScreenState createState() => _GeoScreenState();
}

class _GeoScreenState extends State<GeoScreen> {
  /// NOTIFICATIONS SET UP
  Set<Circle> _circles = Set.from([Circle(
    circleId: CircleId("TisId"),
    fillColor: Colors.red.withOpacity(0.5),
    strokeColor: Colors.transparent,
    center: LatLng(18.0179, -76.8099),
    radius: 200.0,
  )]);

  double r = 0.0;
  LatLng p;
  bool isCircle = false;


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
   new FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _configureLocalTimeZone();
    var initializationSettingsAndroid =
        new AndroidInitializationSettings("app_icon");
    var initializationSettingsIOS =
        new IOSInitializationSettings(onDidReceiveLocalNotification: null);
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: null);

    // _setCircles(p, r);
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }


  Future<void> initPlatform() async {
    if(!mounted) return;
    Geofence.initialize();
    Geofence.startListening(GeolocationEvent.entry, (entry) {
      print("The geo-region was successfully entered " + entry.id);
    });

    Geofence.startListening(GeolocationEvent.exit, (exit) {
      print("The geo-region was successfully exited " + exit.id);
    });
  }


  // void _setCircles(LatLng point, double radius) {
  //   final String markerIdVal = "marker_id_123";
  //   print("This was done");
  //   setState(() {
  //     _circles.add(
  //       Circle(
  //         center: point,
  //         radius: radius,
  //         fillColor: Colors.red.withOpacity(0.5)
  //       )
  //     );
  //   });
  //   print("We are here");
  // }

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(18.0179, -76.8099),
    zoom: 11.5
  );



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          circles: _circles,
          initialCameraPosition: _initialCameraPosition,
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: ElevatedButton(
            child: Text("Add Geolocation"),
            onPressed: () {
              Geolocation location = Geolocation(
                latitude: 18.0179,
                longitude: -76.8099,
                radius: 50.0,
                id: "geoFence124",
              );
              Geofence.addGeolocation(location, GeolocationEvent.entry)
                .then((onValue) {
                  print("The geo-region was added");
              }).catchError((onError) {
                // print("FAILURE !");
                print(onError.toString());
              });
              // Geofence.startListeningForLocationChanges();
            }
          ),
        ),
        Positioned(
          left: 10.0,
          bottom: 10.0,
          child: ElevatedButton(
            child: Text("Remove all Geolocations"),
            onPressed: () {
              Geofence.removeAllGeolocations();
              print("removed");
            },
          ),
        )
    ]);
  }
}
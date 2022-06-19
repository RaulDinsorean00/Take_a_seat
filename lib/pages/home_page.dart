import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_takeaseat/config/config.dart';
import 'package:flutter_takeaseat/models/station.dart';
import 'package:flutter_takeaseat/screens/station_info.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  Future<void> handleLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await location.getLocation();
  }

  List<Station> stations = [];

  @override
  void initState() {
    handleLocationPermission();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      stations = await api.getStations();
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var marker = <Marker>[];
    print(stations);
    for (final station in stations) {
      marker.add(
        Marker(
          point: LatLng(station.lat, station.lng),
          builder: (ctx) => GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StationInfoScreen(station: station);
                    });
              },
              child: Icon(Icons.location_pin, color: Colors.red, size: 40)),
        ),
      );
    }
    //Markers coordinates [PROTOTYPE
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Flexible(
                //Map location + markers [PROTOTYPE]
                child: FlutterMap(
                  options: MapOptions(
                      center: LatLng(45.760696, 21.226788), zoom: 13),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                      attributionBuilder: (_) {
                        return Text(
                          "© OpenStreetMap contributors",
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                        );
                      },
                    ),
                    MarkerLayerOptions(
                      markers: marker,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Timisoara, Romania'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 165, 208, 246),
      ),
    );
  }
}

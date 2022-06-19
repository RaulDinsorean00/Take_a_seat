import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_takeaseat/models/station.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StationInfoScreen extends StatefulWidget {
  final Station station;
  const StationInfoScreen({Key? key, required this.station}) : super(key: key);

  @override
  State<StationInfoScreen> createState() => _StationInfoScreenState();
}

class _StationInfoScreenState extends State<StationInfoScreen> {
  late SharedPreferences prefs;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      prefs = await SharedPreferences.getInstance();
      if (mounted) {
        setState(() {});
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(widget.station.name),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vehicule: '),
              for (var vehicle in widget.station.vehicles)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${vehicle.vehicleId.name} -> '),
                    for (var schedule in vehicle.vehicleTimetable)
                      Text('${schedule} - ')
                  ],
                ),
              MaterialButton(
                child: Text('Add to favorites'),
                color: Color.fromARGB(255, 165, 208, 246),
                onPressed: () async {
                  List<String> favorites = [];
                  if (prefs.getStringList('favorites') != null) {
                    favorites = prefs.getStringList('favorites')!;
                  }
                  print(favorites);
                  print(favorites.contains(widget.station.id));
                  if (!favorites.contains(widget.station.id)) {
                    favorites.add(widget.station.id);
                  }
                  await prefs.setStringList('favorites', favorites);

                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

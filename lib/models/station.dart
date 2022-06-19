import 'package:flutter_takeaseat/models/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'station.g.dart';

@JsonSerializable()
class Station {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final double lat;
  final double lng;
  final List<VehicleData> vehicles;

  Station({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.vehicles,
  });

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);

  Map<String, dynamic> toJson() => _$StationToJson(this);

  @override
  String toString() {
    return 'Station($id, $name, $lat, $lng, $vehicles)';
  }
}

@JsonSerializable(explicitToJson: true)
class VehicleData {
  final Vehicle vehicleId;
  final List<String> vehicleTimetable;

  VehicleData({
    required this.vehicleId,
    required this.vehicleTimetable,
  });

  factory VehicleData.fromJson(Map<String, dynamic> json) =>
      _$VehicleDataFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleDataToJson(this);
}

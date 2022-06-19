// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Station _$StationFromJson(Map<String, dynamic> json) => Station(
      id: json['_id'] as String,
      name: json['name'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      vehicles: (json['vehicles'] as List<dynamic>)
          .map((e) => VehicleData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'lat': instance.lat,
      'lng': instance.lng,
      'vehicles': instance.vehicles,
    };

VehicleData _$VehicleDataFromJson(Map<String, dynamic> json) => VehicleData(
      vehicleId: Vehicle.fromJson(json['vehicleId'] as Map<String, dynamic>),
      vehicleTimetable: (json['vehicleTimetable'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$VehicleDataToJson(VehicleData instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId.toJson(),
      'vehicleTimetable': instance.vehicleTimetable,
    };

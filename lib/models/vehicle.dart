import 'package:json_annotation/json_annotation.dart';

part 'vehicle.g.dart';

@JsonSerializable()
class Vehicle {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String type;

  Vehicle({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  @override
  String toString() {
    return 'Vehicle($id, $name, $type)';
  }
}

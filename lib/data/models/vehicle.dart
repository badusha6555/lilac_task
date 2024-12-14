class Vehicle {
  bool? status;
  List<Data>? data;

  Vehicle({this.status, this.data});

  Vehicle.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  int? id;
  String? uniqueId;
  int? fkVehicleTypeId;
  int? fkFuelTypeId;
  String? year;
  String? price;

  int? isArrival;
  int? isPopular;
  String? isVerified;

  String? createdAt;
  int? listedDays;
  List<Null>? images;
  VehicleType? vehicleType;
  VehicleType? fuelType;

  Data(
      {this.id,
      this.uniqueId,
      this.fkVehicleTypeId,
      this.fkFuelTypeId,
      this.year,
      this.price,
      this.isArrival,
      this.isPopular,
      this.isVerified,
      this.createdAt,
      this.listedDays,
      this.images,
      this.vehicleType,
      this.fuelType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uniqueId = json['unique_id'];
    fkVehicleTypeId = json['fk_vehicle_type_id'];
    fkFuelTypeId = json['fk_fuel_type_id'];
    year = json['year'];
    price = json['price'];
    isArrival = json['is__arrival'];
    isPopular = json['is_popular'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    listedDays = json['listed_days'];

    vehicleType = json['vehicle_type'] != null
        ? VehicleType.fromJson(json['vehicle_type'])
        : null;
    fuelType = json['fuel_type'] != null
        ? VehicleType.fromJson(json['fuel_type'])
        : null;
  }
}

class VehicleType {
  int? id;
  String? name;

  VehicleType({this.id, this.name});

  VehicleType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

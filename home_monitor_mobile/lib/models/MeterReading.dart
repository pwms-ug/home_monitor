import 'dart:ffi';

class MeterReading {
  final String id;
  final String meterNumber;
  final String date;
  final double reading;
  final String location;

  MeterReading({
    required this.id,
    required this.meterNumber,
    required this.date,
    required this.reading,
    required this.location
  });

  factory MeterReading.fromMap(Map<String, dynamic> map) {
    return MeterReading(
        id: map["_id"],
        meterNumber: map["meterNumber"] ?? "",
        reading: double.parse((map["reading"]).toString()),
        location: map["location"] ?? "",
        date: map["date"] ?? ""
    );
  }

}
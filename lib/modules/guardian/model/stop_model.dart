import 'bus_status_model.dart';

class Stop {
  final String time;
  final String? name;
  final String date;
  final String month;
  final bool holiday; // "Pickup" or "Drop-off"
  final bool canceledPickup, canceledDropOff;
  final List<StudentBusStatus>? students;

  Stop({
    required this.time,
    required this.date,
    required this.holiday,
    required this.month,
    this.canceledPickup = false,
    this.canceledDropOff = false,
    this.students,
    this.name
  });
}
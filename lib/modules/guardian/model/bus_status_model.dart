class StudentBusStatus {
  final String name;
  final String admissionNo;
  final String grade;
  final int routeNo;
  final String pickupPoint;
  final String busStatus;
  final String pickupTime;
  final String dropTime;
  final bool gender;
  final String avatar; // Optional: if you want to use image path later

  StudentBusStatus({
    required this.name,
    required this.admissionNo,
    required this.grade,
    required this.routeNo,
    required this.pickupPoint,
    required this.busStatus,
    required this.pickupTime,
    required this.dropTime,
    required this.gender,
    this.avatar = '',
  });
}

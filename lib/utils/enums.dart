enum LoginType {
  guardian('Guardian', 'Guardian'),
  driver('Driver', 'Onboard Driver'),
  coordinator('Coordinator', 'Coordinator');

  final String name;
  final String value;

  const LoginType(this.name, this.value);
}

enum TripType {
  scheduled('Scheduled', 'Scheduled'),
  upcoming('Upcoming', 'Upcoming'),
  completed('Completed', 'Completed');

  final String name;
  final String value;

  const TripType(this.name, this.value);
}


enum BusStatus {
  school('At School', 'At School'),
  transit('In Transit', 'In Transit'),
  completed('Completed', 'Completed');

  final String name;
  final String value;

  const BusStatus(this.name, this.value);
}
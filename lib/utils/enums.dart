enum LoginType {
  guardian('Guardian', 'Guardian'),
  driver('Driver', 'Onboard Driver'),
  coordinator('Coordinator', 'Coordinator');

  final String name;
  final String value;

  const LoginType(this.name, this.value);
}
class Attendee {
  const Attendee(
      {required this.registration_number, required this.time_of_scan, required this.sno});
  final String registration_number;
  final String time_of_scan;
  final int sno;
}

// add sno
// use last sno innprovider for no of participants 
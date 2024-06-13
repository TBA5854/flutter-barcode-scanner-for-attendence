import 'package:barcodescanner/models/attendees.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendence.g.dart';

class Attendees extends $_Attendees {
  List<Attendee> attendees_list = [];
  void add_attendees(String s) {
    attendees_list
        .add(Attendee(registration_number: s, time_of_scan: DateTime.now()));
  }

  void remove_attendees(String s) {
    attendees_list.removeWhere((student) => student.registration_number == s);
  }
}

var obj = new Attendees();

@riverpod
List<Attendee> attendees(ref) {
  return obj.attendees_list;
}

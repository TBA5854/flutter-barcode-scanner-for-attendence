import 'package:barcodescanner/models/attendees.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendence.g.dart';

@riverpod
class Attendees extends _$Attendees {
  @override
  List<Attendee> build() => [];
  void init(List<Attendee> attendees) {
    state = [];
    state.addAll(attendees);
  }

  void add_attendees(String s, int sno) {
    state.add(Attendee(
        registration_number: s,
        time_of_scan: DateFormat("yyyy-MM-dd - kk:mm").format(DateTime.now()),
        sno: sno));
  }

  void remove_attendees(String s) {
    state.removeWhere((student) => student.registration_number == s);
  }

  void emptyAll() => state = [];

  int get no_of_participants => state.length;
}

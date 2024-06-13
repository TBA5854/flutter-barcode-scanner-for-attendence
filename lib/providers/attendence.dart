import 'package:barcodescanner/models/attendees.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendence.g.dart';
@riverpod
class Attendees extends _$Attendees {
  @override
  List<Attendee> build() => [];
  void add_attendees(String s) {
    state.add(Attendee(registration_number: s, time_of_scan: DateTime.now()));
  }

  void remove_attendees(String s) {
    state.removeWhere((student) => student.registration_number == s);
  }
}

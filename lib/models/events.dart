class Event {
  final String title;
  final String description;
  final String club;
  final String type;
  final DateTime dateTime;
  final String venue;
  final String coordinators;
  final String contactInfo;

  Event({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.venue,
    required this.club,
    required this.type,
    required this.coordinators,
    required this.contactInfo,
  });
}
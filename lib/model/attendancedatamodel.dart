class AttendanceRecord {
  final DateTime date;
  final String checkIn;
  final String checkOut;
  final String status;
  final String? location;

  AttendanceRecord({
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.status,
    this.location,
  });
}

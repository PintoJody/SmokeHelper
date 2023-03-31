import 'package:intl/intl.dart';

class Badge {
  final String id;
  final String title;
  final String description;
  final DateTime unlockDate;
  final String icon;

  Badge({
    this.id = "",
    required this.title,
    required this.description,
    required this.unlockDate,
    required this.icon,
  }) {
  }
}

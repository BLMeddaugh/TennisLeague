import 'package:uuid/uuid.dart';

class Player {
  final id = const Uuid();
  final String firstName;
  final String lastName;
  final int level;
  final String phoneNumber;
  final String email;
  final bool willSub;

  Player({
    required this.firstName,
    required this.lastName,
    required int level,
    required this.phoneNumber,
    required this.email,
    this.willSub = false,
  })  : assert(level >= 1 && level <= 5, 'Level must be between 1 and 5'),
        level = level;
}

class Player {
  final String firstName;
  final String lastName;
  final int level;
  final String phoneNumber;
  final String email;

  Player({
    required this.firstName,
    required this.lastName,
    required int level,
    required this.phoneNumber,
    required this.email,
  })  : assert(level >= 1 && level <= 5, 'Level must be between 1 and 5'),
        level = level;
}

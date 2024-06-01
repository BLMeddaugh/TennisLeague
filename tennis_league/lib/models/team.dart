import 'package:tennis_league/models/day_enum.dart';
import 'package:tennis_league/models/player.dart';
import 'package:uuid/uuid.dart';

class Team {
  final Uuid id = const Uuid();
  final List<Player> players;
  final DayOfWeek day;
  final String name;
  final Uuid captain;
  final Uuid? coCaptain;

  Team({
    required this.players,
    required this.day,
    required this.captain,
    this.coCaptain,
    required this.name,
  });
}

// player_service.dart
import 'package:flutter/foundation.dart';
import 'package:tennis_league/models/player.dart';

class PlayerService with ChangeNotifier {
  // Singleton instance
  static final PlayerService _singleton = PlayerService._internal();

  // Factory constructor
  factory PlayerService() {
    return _singleton;
  }

  // Internal constructor
  PlayerService._internal();
  final List<Player> _players = [
    Player(
        firstName: 'John',
        lastName: 'Doe',
        level: 5,
        email: 'john.doe@example.com',
        willSub: true,
        phoneNumber: '123-456-7890'),
    Player(
        firstName: 'Fat',
        lastName: 'Doe',
        level: 4,
        email: 'jane.doe@example.com',
        willSub: true,
        phoneNumber: '234-567-8901'),
    Player(
        firstName: 'Cool',
        lastName: 'Foe',
        level: 4,
        email: 'jane.doe@example.com',
        willSub: false,
        phoneNumber: '234-567-8901'),
    Player(
        firstName: 'Bob',
        lastName: 'Smith',
        level: 3,
        email: 'bob.smith@example.com',
        willSub: true,
        phoneNumber: '345-678-9012'),
    Player(
        firstName: 'Alice',
        lastName: 'Johnson',
        level: 2,
        email: 'alice.johnson@example.com',
        willSub: false,
        phoneNumber: '456-789-0123'),
  ];

  List<Player> get players => _players;

  List<Player> getSubs() {
    return _players.where((player) => player.willSub).toList();
  }

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }

  void removePlayer(int index) {
    _players.removeAt(index);
    notifyListeners();
  }
}

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
  List<Player> _players = [];

  List<Player> get players => _players;

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }

  void removePlayer(int index) {
    _players.removeAt(index);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:tennis_league/models/day_enum.dart';
import 'package:tennis_league/models/team.dart';

import '../models/player.dart';

class TeamService with ChangeNotifier {
  static final TeamService _singleton = TeamService._internal();

  factory TeamService() {
    return _singleton;
  }
  List<Player> mockPlayers = [
    Player(
        firstName: 'John',
        lastName: 'Doe',
        level: 5,
        email: 'john.doe@example.com',
        willSub: true,
        phoneNumber: '1234567890'),
    Player(
        firstName: 'Jane',
        lastName: 'Doe',
        level: 4,
        email: 'jane.doe@example.com',
        willSub: false,
        phoneNumber: '2345678901'),
    // Add more players here...
  ];

  TeamService._internal() {
    _teams = [
      Team(
          name: 'Team 1',
          players: [mockPlayers[0], mockPlayers[1]],
          day: DayOfWeek.Monday,
          captain: mockPlayers[0].id),
      Team(
          name: 'Team 2',
          players: [mockPlayers[1]],
          day: DayOfWeek.Tuesday,
          captain: mockPlayers[1].id),
      // Add more teams here...
    ];
  }

  List<Team> _teams = [];

  List<Team> get teams => _teams;

  void addTeam(Team team) {
    _teams.add(team);
    notifyListeners();
  }

  void removeTeam(Team team) {
    _teams.remove(team);
    notifyListeners();
  }
}

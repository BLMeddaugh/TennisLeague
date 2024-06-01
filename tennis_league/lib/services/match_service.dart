import 'package:tennis_league/models/day_enum.dart';
import 'package:tennis_league/models/match.dart';
import 'package:tennis_league/models/player.dart';
import 'package:tennis_league/models/team.dart';
import 'package:uuid/uuid.dart';

class MatchService {
  List<Match> getMockMatches() {
    var uuid = const Uuid();
    List<Match> matches = [
      Match(
        homeTeam: Team(
            name: 'Team A',
            players: [
              Player(
                  firstName: 'brett',
                  lastName: 'med',
                  level: 5,
                  phoneNumber: '907',
                  email: 'brett.meddaugh')
            ],
            day: DayOfWeek.Tuesday,
            captain: uuid.v4() as Uuid,
            coCaptain:
                Uuid.parse('e67be3c4-7e57-4f97-96d7-39d51f1c87ed') as Uuid),
        awayTeam: Team(
            name: 'Team B',
            players: [
              Player(
                  firstName: 'iris',
                  lastName: 'med',
                  level: 2,
                  phoneNumber: '907',
                  email: 'iris.meddaugh')
            ],
            day: DayOfWeek.Tuesday,
            captain: uuid.v4() as Uuid),
        matchDate: DateTime.now(),
      ),
      Match(
        homeTeam: Team(
            name: 'Team C',
            players: [
              Player(
                  firstName: 'carly',
                  lastName: 'med',
                  level: 3,
                  phoneNumber: '907',
                  email: 'carly.meddaugh')
            ],
            day: DayOfWeek.Wednesday,
            captain: uuid.v4() as Uuid,
            coCaptain:
                Uuid.parse('e67be3c4-7e57-4f97-96d7-39d51f1c87ed') as Uuid),
        awayTeam: Team(
            name: 'Team d',
            players: [
              Player(
                  firstName: 'loren',
                  lastName: 'med',
                  level: 5,
                  phoneNumber: '907',
                  email: 'brett.meddaugh')
            ],
            day: DayOfWeek.Tuesday,
            captain: uuid.v4() as Uuid),
        matchDate: DateTime.now(),
      ),
    ];
    return matches;
  }

  // Future<Match> getMatchById(int id) async {
  //   // TODO: Retrieve a match from the database by its ID
  //   // and return it as a Match object
  // }

  Future<void> addMatch(Match match) async {
    // TODO: Add a new match to the database
  }

  Future<void> updateMatch(Match match) async {
    // TODO: Update an existing match in the database
  }

  Future<void> deleteMatch(int id) async {
    // TODO: Delete a match from the database by its ID
  }
}

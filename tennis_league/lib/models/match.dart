import 'package:tennis_league/models/match_type_enum.dart';
import 'package:tennis_league/models/team.dart';
import 'package:uuid/uuid.dart';
import 'package:tennis_league/models/set.dart';

class Match {
  final Uuid id = const Uuid();
  final Team homeTeam;
  final Team awayTeam;
  final DateTime matchDate;
  List<Set> sets = [];
  int superTiebreakHomeScore = 0;
  int superTiebreakAwayScore = 0;

  Match({
    required this.homeTeam,
    required this.awayTeam,
    required this.matchDate,
  });

  bool get didHomeTeamWin {
    if (this.matchType == MatchType.proSet) {
      return sets[0].homeTeamGameScore > sets[0].awayTeamGameScore;
    } else if(this.matchType == MatchType.twoSetWithTieBreaker) {
      return superTiebreakHomeScore > superTiebreakAwayScore;
    } else if(this.matchType == MatchType.threeSet) {
      int homeSets = 0;
      int awaySets = 0;
      for (var set in sets) {
        if (set.homeTeamGameScore > set.awayTeamGameScore) {
          homeSets++;
        } else {
          awaySets++;
        }
      }
      return homeSets > awaySets;

    }
    return true;
  }

  MatchType get matchType {
    if (sets.length == 1) {
      return MatchType.proSet;
    }
    if (superTiebreakAwayScore > 0 || superTiebreakHomeScore > 0) {
      return MatchType.twoSetWithTieBreaker;
    }
    if (sets.length == 3) {
      return MatchType.threeSet;
    } else {
      return MatchType.notStarted;
    }
  }
}

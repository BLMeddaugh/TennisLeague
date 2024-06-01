class Set {
  int homeTeamGameScore;
  int homeTeamTieBreakScore;
  int awayTeamGameScore;
  int awayTeamTiebreakScore;

  Set(
      {this.homeTeamGameScore = 0,
      this.awayTeamGameScore = 0,
      this.homeTeamTieBreakScore = 0,
      this.awayTeamTiebreakScore = 0})
      : assert(homeTeamGameScore >= 0 && homeTeamGameScore <= 9),
        assert(awayTeamGameScore >= 0 && awayTeamGameScore <= 9);
}

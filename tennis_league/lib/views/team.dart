import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_league/components/player_card.dart';
import 'package:tennis_league/models/player.dart';
import 'package:tennis_league/services/player_service.dart';
import 'package:tennis_league/services/team_service.dart';

class TeamPage extends StatelessWidget {
  TeamPage({super.key});
  final playerService = PlayerService();
  final teamService = TeamService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(teamService.teams.first.name),
      ),
      body: Consumer<PlayerService>(
        builder: (context, playerService, child) {
          return ListView.builder(
            itemCount: playerService.players.length,
            itemBuilder: (context, index) {
              Player player = playerService.players[index];
              return PlayerCard(
                player: player,
                buttonIcon: Icons.remove,
                onButtonPressed: () {
                  this.playerService.removePlayer(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}

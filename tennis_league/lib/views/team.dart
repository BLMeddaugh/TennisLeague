import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_league/models/player.dart';
import 'package:tennis_league/services/player_service.dart';

class TeamPage extends StatelessWidget {
  TeamPage({Key? key}) : super(key: key);
  final playerService = PlayerService();
  final List<Player> players = PlayerService().players;

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerService>(
      builder: (context, playerService, child) {
        return ListView.builder(
          itemCount: playerService.players.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${players[index].firstName} ${players[index].lastName}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Skill level: ${players[index].level}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Phone: ${players[index].phoneNumber}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Email: ${players[index].email}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        playerService.removePlayer(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tennis_league/models/player.dart';

class TeamPage extends StatelessWidget {
  final List<Player> players = [
    Player(
      firstName: 'John',
      lastName: 'Doe',
      level: 3,
      phoneNumber: '123-456-7890',
      email: 'john.doe@example.com',
    ),
    // Add more Player objects here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Page'),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${players[index].firstName} ${players[index].lastName}',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'Skill level: ${players[index].level}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Phone: ${players[index].phoneNumber}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Email: ${players[index].email}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

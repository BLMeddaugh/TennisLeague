import 'package:flutter/material.dart';
import 'package:tennis_league/models/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  final VoidCallback? onButtonPressed;
  final IconData? buttonIcon;
  final String text;

  const PlayerCard(
      {super.key,
      required this.player,
      this.onButtonPressed,
      this.buttonIcon,
      this.text = 'Button'});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${player.firstName} ${player.lastName}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('First Name: ${player.firstName}'),
            Text('Last Name: ${player.lastName}'),
            Text('Email: ${player.email}'),
            Text('Phone: ${player.phoneNumber}'),
            Text('Level: ${player.level}'),
            Text('Willing to sub: ${player.willSub ? 'Yes' : 'No'}'),
            // Add more player details here...
            ElevatedButton.icon(
              icon: Icon(buttonIcon),
              label: Text(text),
              onPressed: onButtonPressed,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tennis_league/models/player.dart';
import 'package:tennis_league/services/player_service.dart';
import 'package:tennis_league/views/team.dart';

class RegisterPlayerPage extends StatelessWidget {
  final playerService = PlayerService();

  RegisterPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final playerFields = [
      'First Name',
      'Last Name',
      'Level',
      'Phone Number',
      'Email'
    ];

    // Create a map to hold the controllers for each field
    final controllers = {
      for (var field in playerFields) field: TextEditingController()
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Player'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: playerFields.length,
          itemBuilder: (context, index) {
            var field = playerFields[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: controllers[field],
                decoration: InputDecoration(
                  labelText: field,
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Player player = Player(
            firstName: controllers['First Name']!.text,
            lastName: controllers['Last Name']!.text,
            level: int.parse(controllers['Level']!.text),
            phoneNumber: controllers['Phone Number']!.text,
            email: controllers['Email']!.text,
          );
          playerService.addPlayer(player);
          for (var field in playerFields) {
            controllers[field]?.clear();
          }
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Player Registered'),
                  content: Text(
                      'Player ${player.firstName} ${player.lastName} has been registered.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TeamPage()),
                        );
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              });
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}

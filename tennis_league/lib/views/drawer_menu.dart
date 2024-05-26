import 'package:flutter/material.dart';
import 'package:tennis_league/views/find_a_sub.dart';
import 'package:tennis_league/views/register_player.dart';
import 'package:tennis_league/views/team.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Team Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeamPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Register'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPlayerPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Find A Sub'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FindASubPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

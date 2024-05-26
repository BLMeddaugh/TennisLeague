import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennis_league/components/player_card.dart';
import 'package:tennis_league/models/player.dart';
import 'package:tennis_league/services/player_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/team.dart';
import '../services/team_service.dart';

class FindASubPage extends StatefulWidget {
  const FindASubPage({super.key});

  @override
  State<FindASubPage> createState() => _FindASubPageState();
}

class _FindASubPageState extends State<FindASubPage> {
  late Player missingPlayer;
  late PlayerService playerService;
  late TeamService teamService;
  late Team team;
  late List<Player> subPlayers;
  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    playerService = Provider.of<PlayerService>(context);
    teamService = Provider.of<TeamService>(context);
    team = teamService.teams.first;
    subPlayers = playerService.getSubs();
    missingPlayer = team.captain; // Set the default missingPlayer
  }

  void setMissingPlayer(Player player) {
    setState(() {
      missingPlayer = player;
      print('Missing player is now: ${missingPlayer.firstName}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Find a Sub',
              style: Theme.of(context).textTheme.labelMedium),
        ),
        body: Row(children: [
          Expanded(
              child: Column(children: [
            Text('Current team',
                style: Theme.of(context).textTheme.labelMedium),
            Expanded(
              child: ListView.builder(
                itemCount: team.players.length,
                itemBuilder: (context, index) {
                  Player player = team.players[index];
                  return PlayerCard(
                      player: player,
                      buttonIcon: Icons.assist_walker,
                      text: 'Filter suitable subs for this player',
                      onButtonPressed: () {
                        setMissingPlayer(player);
                      });
                },
              ),
            ),
          ])),
          Expanded(
              child: Column(children: [
            Text('Sub Players', style: Theme.of(context).textTheme.labelMedium),
            Expanded(
              child: Builder(
                builder: (BuildContext context) {
                  subPlayers.forEach((player) => print(player.level));
                  List<Player> filteredSubPlayers = subPlayers
                      .where((sub) => sub.level == missingPlayer.level)
                      .toList();

                  return ListView.builder(
                    itemCount: filteredSubPlayers.length,
                    itemBuilder: (context, index) {
                      Player player = filteredSubPlayers[index];
                      return PlayerCard(
                          player: player,
                          buttonIcon: Icons.contact_mail,
                          text: 'request sub',
                          onButtonPressed: () {
                            sendEmail(player);
                          });
                    },
                  );
                },
              ),
            ),
          ]))
        ]));
  }
}

void sendEmail(Player player) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: player.email,
    query:
        'subject=Sub Request&body=Hello ${player.firstName}, could you sub for',
  );

  Uri url = Uri.parse(params.toString());
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

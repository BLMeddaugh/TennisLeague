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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    playerService = Provider.of<PlayerService>(context);
    teamService = Provider.of<TeamService>(context);
    team = teamService.teams.first;
    subPlayers = playerService.getSubs();
    missingPlayer = team.players.first; // Set the default missingPlayer
  }

  void setPlayerToFindSubFor(Player player) {
    setState(() {
      missingPlayer = player;
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
                        setPlayerToFindSubFor(player);
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
                          text: 'Email Player',
                          onButtonPressed: () {
                            openEmailToPlayer(player, missingPlayer);
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

// Helper function to open an email client with a pre-filled email to the player
// TODO: add details to email about next match and team, add drop down to top to select sub day
// and also filter out subs who can't play that day
void openEmailToPlayer(Player possibleSub, Player missingPlayer) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: possibleSub.email,
    query:
        'subject=Sub Request&body=Hello ${possibleSub.firstName}, could you sub for ${missingPlayer.firstName}',
  );

  Uri url = Uri.parse(params.toString());
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

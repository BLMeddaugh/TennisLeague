import 'package:flutter/material.dart';

class MatchesView extends StatefulWidget {
  const MatchesView({super.key});

  @override
  State<MatchesView> createState() => _MatchesViewState();
}

class _MatchesViewState extends State<MatchesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green, // Upcoming matches column
              child: const Center(
                child: Text(
                  'Upcoming Matches',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.red, // Past matches column
              child: const Center(
                child: Text(
                  'Past Matches',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

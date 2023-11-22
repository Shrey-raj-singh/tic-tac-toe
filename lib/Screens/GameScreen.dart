import 'package:flutter/material.dart';
import 'package:frontend/provider/roomDataProvider.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});
  static String routeName = '/game-screen';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          Provider.of<RoomDataProvider>(context).roomData.toString(),
        ),
      ),
    );
  }
}
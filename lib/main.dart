import 'package:flutter/material.dart';
import 'package:frontend/Screens/CreateRoom.dart';
import 'package:frontend/Screens/GameScreen.dart';
import 'package:frontend/Screens/HomeScreen.dart';
import 'package:frontend/Screens/JoinRoom.dart';
import 'package:frontend/Utils/customColors.dart';
import 'package:frontend/provider/roomDataProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          HomeScreen.routeName: (context)=> const HomeScreen(),
          JoinScreen.routeName: (context)=> const JoinScreen(),
          CreateRoom.routeName: (context)=> const CreateRoom(),
          GameScreen.routeName: (context)=> const GameScreen(),
        },
        initialRoute:  HomeScreen.routeName,
      ),
    );
  }
}

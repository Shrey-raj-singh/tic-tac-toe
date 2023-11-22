import 'package:flutter/material.dart';
import 'package:frontend/Screens/CreateRoom.dart';
import 'package:frontend/Screens/JoinRoom.dart';
import 'package:frontend/Widgets/customButton.dart';
import 'package:frontend/responsive/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = '/main-menu';

  void createRoom(BuildContext context){
    Navigator.pushNamed(context, CreateRoom.routeName);
  }
  void joinRoom(BuildContext context){
    Navigator.pushNamed(context, JoinScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(onTap: ()=>createRoom(context), text: "Create Room"),
            SizedBox(height: 18,),
            CustomButton(onTap: ()=>joinRoom(context), text: "Join Room"),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:frontend/Screens/GameScreen.dart';
import 'package:frontend/provider/roomDataProvider.dart';
import 'package:frontend/resources/socketio.dart';
import 'package:provider/provider.dart';

class SocketMethods{
  final _socketClient = SocketClient.instance.socket!;

  void createRoom(String nickname){
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom',{
        'nickname':nickname,
      });
    }
  }
  void createRoomSuccessListener(BuildContext context){
      _socketClient.on('createRoomSuccess' , (room){
        Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room);
        Navigator.pushNamed(context,GameScreen.routeName);
      });
  }
}
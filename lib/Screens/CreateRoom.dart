import 'package:flutter/material.dart';
import 'package:frontend/Widgets/customButton.dart';
import 'package:frontend/Widgets/customText.dart';
import 'package:frontend/Widgets/customTextField.dart';
import 'package:frontend/resources/socketMethods.dart';
import 'package:frontend/responsive/responsive.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});
  static String routeName = '/create-room';

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _namecontroller = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose(){
    super.dispose();
    _namecontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(shadows: [
                Shadow(
                  blurRadius: 40,
                  color: Colors.blue,
                )
              ], text: 'Create Room', fontSize: 70),
              SizedBox(height: size.height*0.08,),
              CustomTextField(controller: _namecontroller, hintText: "Enter your room name"),
              SizedBox(height: size.height*0.045,),
              CustomButton(onTap: ()=> _socketMethods.createRoom(_namecontroller.text), text: "Create Room")
            ],
          ),
        ),
      ),
    );
  }
}

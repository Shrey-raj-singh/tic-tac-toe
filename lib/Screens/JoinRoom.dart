import 'package:flutter/material.dart';
import 'package:frontend/Widgets/customButton.dart';
import 'package:frontend/Widgets/customText.dart';
import 'package:frontend/Widgets/customTextField.dart';
import 'package:frontend/responsive/responsive.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({super.key});
  static String routeName = '/join-room';

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _gamecontroller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _namecontroller.dispose();
    _gamecontroller.dispose();
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
              ], text: 'Join Room', fontSize: 70),
              SizedBox(height: size.height*0.08,),
              CustomTextField(controller: _namecontroller, hintText: "Enter your nick name"),
              SizedBox(height: 20,),
              CustomTextField(controller: _gamecontroller, hintText: "Enter room I'D"),
              SizedBox(height: size.height*0.045,),
              CustomButton(onTap: (){}, text: "Join Room")
            ],
          ),
        ),
      ),
    );
  }
}
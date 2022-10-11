import 'package:cgpa_app/ui/screens/auth_screen.dart';
import 'package:flutter/material.dart';
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CButton(title: 'Login', onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Login())),),
            CButton(title: 'Register', onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>Register())),),
          ],
        ),
      ),
    );
  }
}

class CButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const CButton({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(onPressed: onPressed, child: Text(title),),
    );
  }
}

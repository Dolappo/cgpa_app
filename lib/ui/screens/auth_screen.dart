import 'package:cgpa_app/ui/screens/auth_view_model.dart';
import 'package:cgpa_app/ui/screens/entry/result_entry_screen.dart';
import 'package:cgpa_app/ui/screens/onboarding.dart';
import 'package:cgpa_app/ui/widgets/c_textfield.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CTextField(
                    hintText: 'Enter your Username',
                    controller: model.usernameController),
                CButton(title: 'Login', onPressed: () {}),
              ],
            ),
          );
        });
  }
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            body: Column(
              children: [
                CTextField(
                    hintText: 'Enter your Full name',
                    controller: model.fullNameController),
                CTextField(
                    hintText: 'Enter preferred username',
                    controller: model.newUsernameController),
                CButton(
                    title: 'Register',
                    onPressed: () => Future.delayed(const Duration(seconds: 3))
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ShowBoxesScreen()))))
              ],
            ),
          );
        });
  }
}

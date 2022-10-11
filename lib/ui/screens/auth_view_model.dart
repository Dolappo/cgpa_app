import 'package:cgpa_app/core/services/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../app/app_setup.locator.dart';
class AuthViewModel extends BaseViewModel{
  final _local = locator<LocalStorageService>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController newUsernameController = TextEditingController();
void login(){
  if(_local.userBox.containsKey(usernameController.text)){
    }
}

}
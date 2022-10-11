class UserRepo{
  late String _username;
  late String _fullName;

  String get username => _username;
  String get fullName => _fullName;

  initNames(String username, String fullName){
    _username = username;
    _fullName = fullName;
  }
}
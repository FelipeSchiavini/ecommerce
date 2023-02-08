bool emailValidator (String email) {
  bool emailIsValid =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  return emailIsValid;
}

bool passwordValidator(String password) {
  bool passwordIsValid = password.isNotEmpty && password.length >= 6;
  return passwordIsValid;
}

bool nameValidator(String name) {
  bool nameIsValid = name.isNotEmpty && name.length >= 3;
  return nameIsValid;
}
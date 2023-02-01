bool emailValidator (String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool passwordValidator(String password) {
  return password.isNotEmpty && password.length >= 6;
}

bool nameValidator(String name) {
  return name.isNotEmpty && name.length >= 3;
}
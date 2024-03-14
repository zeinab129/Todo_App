bool isValidEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isValidPhone(String phone) {
  return RegExp(r"^\+?0[0-9]{10}$").hasMatch(phone);
}

bool isValidUserName(String userName) {
  return RegExp(r"^[A-Za-z0-9_-]{3,9}$")
      .hasMatch(userName);
}

bool isValidPassword(String pass) {
  return RegExp(r"^[A-Za-z0-9_-]{6,}$")
      .hasMatch(pass);
}

bool isValidTaskTitle(String title){
  return RegExp(r"^[A-Za-z0-9_-]{4,}$").hasMatch(title);
}

bool isValidTaskDesc(String desc){
  return RegExp(r"^[A-Za-z0-9_-]{15,}$").hasMatch(desc);
}
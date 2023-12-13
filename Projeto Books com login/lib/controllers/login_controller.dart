class LoginController {
  final String _phone;
  final String _password;

  LoginController(this._phone, this._password);

  bool isValidLogin() {
    return _phone == '123' && _password == '123';
  }
}

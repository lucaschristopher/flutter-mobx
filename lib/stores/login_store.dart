import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final RegExp emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  // Pelo menos 4 (quatro) caracteres, com pelo menos um dígito,
  // uma letra maiúscula e uma letra minúscula
  final RegExp passwordRegExp =
      RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{4,}$");

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool passwordVisibility = false;

  @observable
  bool isLoading = false;

  @observable
  bool loggedIn = false;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void togglePasswordVisibility() => passwordVisibility = !passwordVisibility;

  @action
  Future<void> login() async {
    isLoading = true;

    // Simulating data processing
    await Future.delayed(Duration(seconds: 2));

    isLoading = false;
    loggedIn = true;

    setEmail("");
    setPassword("");
  }

  @action
  void logout() {
    loggedIn = false;
  }

  @computed
  bool get isFormValid =>
      emailRegExp.hasMatch(email) && passwordRegExp.hasMatch(password);

  @computed
  Function get loginButtonPressed => isFormValid && !isLoading ? login : null;
}

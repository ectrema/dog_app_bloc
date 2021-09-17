abstract class NavbarState {}

class ShowLogin extends NavbarState {
  final String title = "Login";
  final int itemIndex = 0;
}

class ShowDog extends NavbarState {
  final String title = "Dog";
  final int itemIndex = 1;
}
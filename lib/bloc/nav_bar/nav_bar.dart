import 'package:bloc/bloc.dart';
import 'package:dog_app_bloc/bloc/nav_bar/nav_bar_state.dart';

enum NavbarItems { Login, Dog }

class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
  NavbarBloc(NavbarState initialState) : super(initialState);


  @override
  NavbarState get initialState => ShowLogin();

  @override
  Stream<NavbarState> mapEventToState(
    NavbarItems event,
  ) async* {
    switch (event) {
      case NavbarItems.Dog:
        yield ShowDog();
        break;
      default:
        yield ShowLogin();
        break;
    }
  }
}

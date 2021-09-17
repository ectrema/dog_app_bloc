import 'package:dog_app_bloc/bloc/nav_bar/nav_bar.dart';
import 'package:dog_app_bloc/bloc/nav_bar/nav_bar_state.dart';
import 'package:dog_app_bloc/presentation/home/dog/dog_view.dart';
import 'package:dog_app_bloc/presentation/home/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NavbarBloc? _navbarBloc;

  @override
  void initState() {
    super.initState();
    _navbarBloc = NavbarBloc(ShowLogin());
  }

  @override
  void dispose() {
    _navbarBloc!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _navbarBloc,
      builder: (BuildContext context, NavbarState state) {
        if (state is ShowDog) {
          return buildHomepage(state.title, Colors.blue, state.itemIndex);
        } else if (state is ShowLogin) {
          return buildHomepage(state.title, Colors.red, state.itemIndex);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Scaffold buildHomepage(String title, Color color, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: currentIndex == 0 ? const LoginView() : const DogView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) _navbarBloc!.add(NavbarItems.Login);
          if (index == 1) _navbarBloc!.add(NavbarItems.Dog);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Dog',
          ),
        ],
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:dog_app_bloc/bloc/login/login.dart';
import 'package:dog_app_bloc/bloc/login/login_event.dart';
import 'package:dog_app_bloc/bloc/login/login_state.dart';
import 'package:dog_app_bloc/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc? loginBloc;
  final TextEditingController _emailController =
      TextEditingController(text: 'eve.holt@reqres.in');
  final TextEditingController _passwordController =
      TextEditingController(text: 'cityslicka');

  @override
  void initState() {
    loginBloc = LoginBloc(
      LoginState(),
      repository: LoginRepository(
        client: Dio(
          BaseOptions(
            baseUrl: 'https://reqres.in/api',
          ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login'),
          Column(
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                bloc: loginBloc,
                builder: (context, state) => _buildLoginBloc(state),
              ),
              InkWell(
                child: Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(15),
                  height: 30,
                  child: Text('Submit'),
                  alignment: Alignment.center,
                ),
                onTap: () async {
                  loginBloc!.add(
                    LoginEventSubmit(
                      _emailController.text,
                      _passwordController.text,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card _buildLoginBloc(LoginState state) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              style: const TextStyle(
                color: Colors.black,
              ),
              enabled: !state.isBusy,
              decoration: InputDecoration(
                hintText: 'Email',
                labelStyle: TextStyle(
                  color: state.emailError == FieldError.empty ||
                          state.emailError == FieldError.invalid
                      ? Colors.red
                      : Colors.black,
                ),
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _passwordController,
              style: const TextStyle(
                color: Colors.black,
              ),
              enabled: !state.isBusy,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

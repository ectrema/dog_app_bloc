import 'package:dio/dio.dart';
import 'package:dog_app_bloc/bloc/login/login_bloc.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    loginBloc = LoginBloc(
      LoginState(),
      repository: LoginRepository(
        Dio(
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
                  child: const Text('Submit'),
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

  Widget _buildLoginBloc(LoginState state) {
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
              style: TextStyle(
                color: state.emailError != FieldError.valid
                    ? Colors.red
                    : Colors.black,
              ),
              onChanged: (value) {
                loginBloc!.add(LoginEventEmailChanged(_emailController.text));
              },
              enabled: !state.isBusy,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _passwordController,
              style: TextStyle(
                color: state.passwordError != FieldError.valid
                    ? Colors.red
                    : Colors.black,
              ),
              onChanged: (value) {
                loginBloc!
                    .add(LoginEventPasswordChanged(_passwordController.text));
              },
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
            state.token != null && state.token != ''
                ? const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text('200'),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

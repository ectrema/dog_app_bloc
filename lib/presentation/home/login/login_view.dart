import 'package:dio/dio.dart';
import 'package:dog_app_bloc/bloc/email/email.dart';
import 'package:dog_app_bloc/bloc/email/email_event.dart';
import 'package:dog_app_bloc/bloc/email/email_state.dart';
import 'package:dog_app_bloc/bloc/password/password.dart';
import 'package:dog_app_bloc/bloc/password/password_event.dart';
import 'package:dog_app_bloc/bloc/password/password_state.dart';
import 'package:dog_app_bloc/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  EmailBloc? emailBloc;
  PasswordBloc? password;
  final TextEditingController _emailController = TextEditingController(text: 'eve.holt@reqres.in');
  final TextEditingController _passwordController = TextEditingController(text: 'cityslicka');

  @override
  void initState() {
    emailBloc = EmailBloc(EmailState());
    password = PasswordBloc(PasswordState());
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  BlocBuilder<EmailBloc, EmailState>(
                    bloc: emailBloc,
                    builder: (context, state) {
                      if (state.isBusy) {
                        return const CircularProgressIndicator();
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            controller: _emailController,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
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
                        ],
                      );
                    },
                  ),
                  BlocBuilder<PasswordBloc, PasswordState>(
                    bloc: password,
                    builder: (context, state) {
                      if (state.isBusy) {
                        return const CircularProgressIndicator();
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextField(
                            controller: _passwordController,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
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
                          const SizedBox(height: 30),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
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
              emailBloc!.add(EmailEventSubmit(_emailController.text));
              password!.add(PasswordEventSubmit(_passwordController.text));
              LoginRepository repository = LoginRepository(
                client: Dio(
                  BaseOptions(
                    baseUrl: 'https://reqres.in/api',
                  ),
                ),
              );
              await repository.login(
                email: _emailController.text,
                password: _passwordController.text,
              ).then((value) => print(value));
            },
          ),
        ],
      ),
    );
  }
}

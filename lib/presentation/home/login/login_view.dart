import 'package:dog_app_bloc/bloc/email/email.dart';
import 'package:dog_app_bloc/bloc/email/email_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  EmailBloc? emailBloc;
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    emailBloc = EmailBloc(EmailState());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Login'),
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
        ],
      ),
    );
  }
}
                        // InkWell(
                        //   child: Text('Submit'),
                        //   onTap: () => _bloc.add(EmailEventSubmit(
                        //       _emailController.text)),
                        // ),
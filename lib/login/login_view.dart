import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/login/bloc/login_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginBloc _loginBloc;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login View")),
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (prev, current) => current.email != prev.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Enter your email",
                        border: OutlineInputBorder(),
                      ),

                      onChanged: (value) {
                        context.read<LoginBloc>().add(EmailChanged(value));
                      },
                      onFieldSubmitted: (v) {},
                    );
                  },
                ),
                SizedBox(height: 10),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (prev, current) =>
                      current.password != prev.password,
                  builder: (context, state) {
                    return TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                        hintText: "Enter your password",

                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(PasswordChanged(value));
                      },
                      onFieldSubmitted: (v) {},
                    );
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

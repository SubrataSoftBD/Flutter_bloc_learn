import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                ),

                onChanged: (value) {},
              ),
              SizedBox(height: 10),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: "Enter your password",

                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: (){}, child: Text("Login"),
                    style: ElevatedButton.styleFrom(

                    ),

                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

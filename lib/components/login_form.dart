import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please insert some value';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Login',
              hintText: 'Insert your login',
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please insert some value';
              }
              return null;
            },
            decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: 'Password',
              hintText: 'Insert your password',
            ),
          ),
          ElevatedButton(onPressed: () => {}, child: Text('submit')),
        ],
      ),
    );
  }
}

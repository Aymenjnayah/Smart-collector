import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Name',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: 'Email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Phone Number',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Password',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'Confirm Password',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please confirm your password';
                }
                                if (value != _passwordController.text) {
                  return 'Password does not match';
                }
                return null;
              },
            ),
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              color : Colors.green,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Signing up...')));
                }
              },
              child: Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}

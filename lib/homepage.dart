import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();

  String? validatEamil(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter an email adress';
    }
    if (!EmailValidator.validate(value)) {
      return 'please enter an valid email adress';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter a password';
    }
    if (value.length < 8) {
      return 'password must be at lest 8 characters long';
    }
    return null;
  }

  void submitForm() {
    if (_formkey.currentState!.validate()) {
      print('The form is validate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("form validation"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'enter your email id',
                    labelText: 'email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: validatEamil,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'enter your password',
                      labelText: 'password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_clock_rounded)),
                  validator: validatePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: submitForm,
                      child: const Text(
                        "submit",
                      )),
                ),
              ],
            )),
      ),
    );
  }
}

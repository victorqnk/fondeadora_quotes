import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fondeadora/controllers/user.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool hidden = true;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
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
      appBar: AppBar(
        title: Text(
          'Entrar',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextFormField(
                key: Key('email'),
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (val) {
                  return EmailValidator.validate(val!.trim())
                      ? null
                      : 'Ingresa un email válido';
                },
                // onSaved: (val) {
                //   email.text = val!.trim();
                // },
              ),
              TextFormField(
                controller: password,
                obscureText: hidden ? true : false,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    icon: Icon(
                      hidden ? Icons.visibility : Icons.visibility_off,
                      size: 21.0,
                    ),
                  ),
                ),
                validator: (val) {
                  return val!.isEmpty || val.length < 5
                      ? 'Contraseña inválida'
                      : null;
                },
                // onSaved: (val) {
                //   password = val!.trim();
                // },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  child: const Text('Entrar'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // _formKey.currentState!.save();
                      context
                          .read<UserController>()
                          .login(email: email.text, password: password.text);
                      Navigator.pushReplacementNamed(context, '/');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:blog_application/utils/utils.dart';
import 'package:blog_application/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.showTopFlushbar(
                          title: "Incorrect Email",
                          message: "Please enter your email",
                          context: context);
                      return "Please enter your email";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      Utils.showTopFlushbar(
                        title: "Incorrect Password",
                        message: "Please enter your password",
                        context: context,
                      );
                      return "Please enter your password";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, String> data = {
                        "email": _emailController.text,
                        "password": _passwordController.text,
                      };
                      authViewModel.loginApi(data, context);
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/http/http.dart';
import 'package:food_court/core/models/models.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/core/services/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final loginDTO = LoginDTO(
        phoneNumber: _phoneNumberController.text,
        password: _passwordController.text,
      );

      try {
        getIt.get<UserStateService>().updateUser(
              await HttpClientService.login(loginDTO),
            );
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
          context.go(PathName.products);
        });
      }
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Please log in to your account.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: const Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  // keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                _isLoading
                    ? ElevatedButton.icon(
                        onPressed: null,
                        icon: const CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Colors.white,
                        ),
                        label: const Text('Logging in...'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                const SizedBox(height: 24.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go(PathName.registration);
                      },
                      child: const Text(
                        'Need an account? Sign up',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go(PathName.products);
                      },
                      child: const Text(
                        'MainProduct',
                        style: TextStyle(color: Colors.blueAccent),
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

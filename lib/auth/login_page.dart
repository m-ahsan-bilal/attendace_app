import 'package:attendace_task_app/widgets/my_button.dart';
import 'package:attendace_task_app/widgets/my_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginUser extends StatefulWidget {
  // final void Function()? onTap;
  LoginUser({
    super.key,
  });

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  bool _obscureText = true;
  bool _isLoading = false; // New loading state
  String? _errorMessage; // To store and display custom error messages
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Toggles password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // Login method with Firebase Authentication
  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
      try {
        // Firebase Authentication logic
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        // If successful, navigate to home dashboard
        context.go('/home_dash');
      } on FirebaseAuthException catch (e) {
        // Handle authentication errors
        if (e.code == 'user-not-found') {
          setState(() {
            _errorMessage = 'No user found for that email.';
          });
        } else if (e.code == 'wrong-password') {
          setState(() {
            _errorMessage = 'Wrong password provided for that user.';
          });
        } else {
          setState(() {
            _errorMessage = 'An error occurred. Please try again later.';
          });
        }
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Icon(
                Icons.person_outline_sharp,
                size: 140,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 30),
              Text(
                "Attendance System",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 25),
              // Email field with validation
              MyTextField(
                focusNode: emailFocus,
                controller: emailController,
                hintText: "Email",
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!regex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
              ),
              const SizedBox(height: 20),
              // Password field with validation
              MyTextField(
                focusNode: passwordFocus,
                controller: passwordController,
                hintText: 'Password',
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 30),
              // Display error messages
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 10),
              // Sign In button with loading indicator
              MyButton(
                onTap: _isLoading ? null : login, // Disable button when loading
                title: _isLoading ? "Signing In..." : "Sign In",
              ),
              const SizedBox(height: 20),
              // Divider and social media sign in options
              Row(
                children: [
                  const Expanded(
                    child: Divider(thickness: 0.5),
                  ),
                  Text(
                    ' Or With ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const Expanded(
                    child: Divider(thickness: 0.5),
                  ),
                ],
              ),
              // Remove Spacer() here to avoid layout issues
              // Social media login buttons, if necessary
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     SquareTile(imagePath: "assets/images/google.png"),
              //     SizedBox(width: 30),
              //     SquareTile(imagePath: "assets/images/facebook.png"),
              //   ],
              // ),
              // Register Now link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not A Member?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () => context.go('/register_user'),
                    child: Text(
                      'Register Now!',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

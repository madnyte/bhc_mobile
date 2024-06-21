import 'package:bhc_mobile/widgets/tile.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void onSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 75,
              ),

              // logo
              const Image(
                image: AssetImage(
                  'assets/splash.png',
                ),
                width: 100,
                height: 100,
              ),

              const SizedBox(
                height: 25,
              ),

              // welcome back
              Text(
                "Welcome back",
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(
                height: 25,
              ),

              // username,
              CustomTextfield(
                controller: usernameController,
                hintText: 'username',
                obscureText: false,
              ),

              // password
              const SizedBox(
                height: 25,
              ),

              CustomTextfield(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              CustomButton(
                onTap: onSignIn,
                title: 'Sign In',
              ),

              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.75,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text('Or Continue with'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.75,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 50,
              ),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tile(path: 'assets/google.png'),
                  SizedBox(
                    width: 25.0,
                  ),
                  Tile(path: 'assets/facebook.png'),
                ],
              ),

              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Register now",
                    style: Theme.of(context).textTheme.bodyLarge?.apply(
                          color: Colors.blue,
                        ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

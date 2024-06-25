import 'package:bhc_mobile/services/authentication/auth.dart';
import 'package:bhc_mobile/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onSignIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.loaderOverlay.show();
      await auth
          .collection('users')
          .authWithPassword(usernameController.text, passwordController.text)
          .then((resp) {
        if (resp.record != null) {
          context.loaderOverlay.hide();
          Fluttertoast.showToast(
            msg: 'Log In Successful',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          context.go('/');
        }
      }).catchError((err) {
        if (err is ClientException) {
          context.loaderOverlay.hide();
          Fluttertoast.showToast(
            msg: err.response['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: LoaderOverlay(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                      onTap: () {
                        onSignIn(context);
                      },
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
          ),
        ),
      ),
    );
  }
}

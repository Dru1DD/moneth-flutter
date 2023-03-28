import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../widgets/widgets.dart';
import '../store/store.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpScreen({
    super.key,
    required this.onClickedSignIn,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late bool isHidePassword;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    isHidePassword = true;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signUpHandler(context, store) async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ))
          .user;

      if (user != null) {
        store.setLoggedIn(true);
        store.setUserUid(user.uid);
        GoRouter.of(context).push('/');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text('Error with message: $e.message'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final MobXStore store = Provider.of<MobXStore>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 44.0),
            children: [
              const SizedBox(height: 18),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter an email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: TextField(
                  controller: _passwordController,
                  obscureText: isHidePassword,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: 'Enter a password',
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          isHidePassword = !isHidePassword;
                        });
                      },
                      icon: Icon(
                        isHidePassword ? Icons.remove_red_eye : Icons.password,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              BuildButton(
                buttonText: 'Sign Up',
                pressedCallback: () => signUpHandler(context, store),
              ),
              const SizedBox(height: 18),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    color: Colors.black38,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignIn,
                      text: 'Sign in',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

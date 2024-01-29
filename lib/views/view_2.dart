import 'package:celest_backend/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_celest/views/view_1.dart';

class View2 extends StatefulWidget {
  const View2({super.key});

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void startLoading() => setState(() => isLoading = true);
  void stopLoading() => setState(() => isLoading = false);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: ht.height,
        width: ht.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Email and password required')));
                            return;
                          }
                          startLoading();
                          await celest.functions.auth
                              .login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text,
                          )
                              .then((Responsee value) {
                            if (value.status) {
                              stopLoading();
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const View1(),
                              ));
                            } else {
                              stopLoading();

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(value.message)));
                            }
                          });
                        },
                        child: const Text('Login'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:celest_backend/client.dart';
import 'package:flutter/material.dart';

class View1 extends StatelessWidget {
  const View1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          // Call your function using the Celest client
          future: celest.functions.greeting.sayHello('David'),
          builder: (_, snapshot) => switch (snapshot) {
            AsyncSnapshot(:final data?) => Text(data),
            AsyncSnapshot(:final error?) =>
              Text('${error.runtimeType}: $error'),
            _ => const CircularProgressIndicator(),
          },
        ),
      ),
    );
  }
}

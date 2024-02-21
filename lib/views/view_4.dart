import 'package:flutter/material.dart';
import 'package:testing_celest/views/view_3.dart';

class View4 extends StatelessWidget {
  const View4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              goTo(context: context, view: const View3());
            },
            child: const Text('go to pageview')),
      ),
    );
  }
}

void goBack(BuildContext context) {
  // killKeyboard(context);
  Navigator.of(context).pop();
}

void goTo({
  required BuildContext context,
  required Widget view,
}) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => view,
  ));
}

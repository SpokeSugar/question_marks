import 'package:flutter/material.dart';
import 'package:restartable/restartable.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.e}) : super(key: key);
  final Exception? e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Error Happend"),
      ),
      body: Column(children: [
        if (e is Exception) Text(e.toString()),
        ElevatedButton(
          onPressed: () => RestartWidget.reset(context),
          child: const Text("Return Home"),
        ),
      ]),
    );
  }
}

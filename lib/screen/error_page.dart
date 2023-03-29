import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Error Happend"),
      ),
      body: const Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text("Return Home"),
        ),
      ),
    );
  }
}

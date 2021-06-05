import 'package:flutter/material.dart';

class CommonScreen extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  const CommonScreen({Key? key, required this.body, this.floatingActionButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: body,
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: floatingActionButton,
    ));
  }
}

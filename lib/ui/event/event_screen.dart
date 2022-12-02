import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text(
            'This is event screen!',
          ),
        ],
      ),
    );
  }
}

import 'package:challenge_tractian_app/shared/states/states.dart';
import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  final String title;
  final Error error;
  final VoidCallback restard;
  const WidgetError(
      {super.key,
      required this.error,
      required this.title,
      required this.restard});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 100,
            color: Colors.red,
          ),
          Text("$title:"),
          Text(error.error),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton.icon(
            onPressed: restard,
            label: const Text("Restart"),
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
    );
  }
}

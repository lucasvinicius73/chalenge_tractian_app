import 'package:challenge_tractian_app/shared/states.dart';
import 'package:flutter/material.dart';

class WidgetError extends StatelessWidget {
  final String title;
  final Error error;
  const WidgetError({super.key, required this.error, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("$title: \n${error.error}"),
    );
  }
}

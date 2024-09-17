import 'package:challenge_tractian_app/app/asset/asset_view.dart';
import 'package:challenge_tractian_app/app/home/home_view.dart';
import 'package:flutter/material.dart';
import 'shared/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorScheme: MaterialTheme.lightScheme()),
      routes: {
        "/": (context) => const HomeView(),
        "/assets_view": (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map;
          return AssetView(
            companyModel: args["companyModel"],
          );
        }
      },
    );
  }
}

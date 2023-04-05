import 'package:cofftenser/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() => runApp(const AppWidget());

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Cofftenser',
        home: const HomePage(),
        theme: ThemeData(
          fontFamily: 'Heebo'
        ),
      ),
    );
  }
}
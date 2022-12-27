import 'package:flutter/material.dart';
import 'package:ramosa_apps/utils.dart';

void main() {
  runApp(const Ramosa());
}

class Ramosa extends StatelessWidget {
  const Ramosa({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}

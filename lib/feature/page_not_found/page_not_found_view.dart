import 'package:flutter/material.dart';

class PageNotFoundView extends StatelessWidget {
  const PageNotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text('Kosong')],
      ),
    );
  }
}

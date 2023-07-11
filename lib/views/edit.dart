import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  final int? pontoId;
  const Edit({super.key, this.pontoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Container(),
    );
  }
}

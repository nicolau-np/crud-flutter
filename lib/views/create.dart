import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Nome'),
            ),
            Container(
              height: 7,
            ),const TextField(
              decoration: InputDecoration(hintText: 'Descricao'),
            ),
            Container(
              height: 7,
            ),const TextField(
              decoration: InputDecoration(hintText: 'Lat'),
            ),
            Container(
              height: 7,
            ),const TextField(
              decoration: InputDecoration(hintText: 'Long'),
            ),
            Container(
              height: 7,
            ),const TextField(
              decoration: InputDecoration(hintText: 'Tipo'),
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'File'),
            ),
            Container(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

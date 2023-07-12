import 'package:ecomap/model/ponto.dart';
import 'package:ecomap/services/ponto_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  PontoService get pontoService => GetIt.I<PontoService>();
  Ponto? ponto;

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
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Descricao'),
            ),
            Container(
              height: 7,
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Lat'),
            ),
            Container(
              height: 7,
            ),
            const TextField(
              decoration: InputDecoration(hintText: 'Long'),
            ),
            Container(
              height: 7,
            ),
            const TextField(
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

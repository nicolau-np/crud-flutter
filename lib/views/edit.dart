import 'package:ecomap/model/ponto.dart';
import 'package:ecomap/services/ponto_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Edit extends StatefulWidget {
  final int? pontoId;
  const Edit({super.key, this.pontoId});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  PontoService get pontoService => GetIt.I<PontoService>();
  String errorMessage = '';
  Ponto? ponto;

  final TextEditingController _nome = TextEditingController();

  @override
  void initState() {
    pontoService.getPonto(widget.pontoId ?? 1).then((response) {
      /*if (response.error!) {
        errorMessage = response.errorMessage ?? '';
      }*/
      ponto = response.data;
      //_nome.text = ponto.nome;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
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

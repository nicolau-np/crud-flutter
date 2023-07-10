import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ecomap/providers/ponto_provider.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar'),
      ),
      body: Column(
        children: [
          const Text('hello'),
          Consumer<PontoProvider>(
            builder: (context, pontoProvider, _) {
              final pontos = pontoProvider.pontos;

              if (pontos.isEmpty) {
                return const Center(
                  child: Text('Nenhum ponto encontrado'),
                );
              }

              return ListView.builder(
                itemCount: pontos.length,
                itemBuilder: (context, index) {
                  final ponto = pontos[index];

                  return ListTile(
                    title: Text(ponto.nome),
                    subtitle: Text(ponto.descricao),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

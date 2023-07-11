import 'package:ecomap/model/api_response.dart';
import 'package:ecomap/model/ponto.dart';
import 'package:ecomap/services/ponto_service.dart';
import 'package:ecomap/views/create.dart';
import 'package:ecomap/views/delete.dart';
import 'package:ecomap/views/edit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  PontoService get service => GetIt.I<PontoService>();

  late ApiResponse<List<Ponto>> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchPontos();
    super.initState();
  }

  _fetchPontos() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getPontosList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const Create()));
          },
        ),
        body: _isLoading
            ? const CircularProgressIndicator()
            : ListView.separated(
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  color: Colors.green,
                ),
                itemBuilder: (_, index) {
                  return Dismissible(
                    key: ValueKey(_apiResponse.data![index].id),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      Navigator.of(context).pop();
                    },
                    confirmDismiss: (direction) async {
                      final result = await showDialog(
                          context: context, builder: (_) => const Delete());
                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.only(left: 16),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                    ),
                    child: ListTile(
                      title: Text(_apiResponse.data![index].nome ?? ''),
                      subtitle: Text(_apiResponse.data![index].descricao ?? ''),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Edit(pontoId: _apiResponse.data![index].id)));
                      },
                    ),
                  );
                },
                itemCount: _apiResponse.data!.length,
              ));
  }
}

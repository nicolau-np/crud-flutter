//import 'package:ecomap/services/ponto_service.dart';
//import 'package:ecomap/views/index.dart';
import 'package:ecomap/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:ecomap/providers/ponto_provider.dart';
import 'package:provider/provider.dart';
//import 'package:get_it/get_it.dart';

/*void setupLocator() {
  GetIt.I.registerLazySingleton(() => PontoService());
}*/

void main() {
  //setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PontoProvider(),
          lazy: false,
        ),],
        child:
    MaterialApp(
      title: 'CRUD FLUTTER',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const IndexPage(),
    ));
  }
}

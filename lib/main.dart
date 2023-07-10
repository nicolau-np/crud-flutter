import 'package:ecomap/providers/ponto_provider.dart';
import 'package:ecomap/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PontoProvider()),
      ],
      child: MaterialApp(
        title: 'CRUD FLUTTER',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: const IndexPage(),
      ),
    );
  }
}

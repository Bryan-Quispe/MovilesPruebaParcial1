import 'package:flutter/material.dart';
import 'package:prueba1parcial/view/viewnums.dart';


void main() {
  runApp(MiAppGood());
}

class MiAppGood extends StatelessWidget {
  const MiAppGood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algoritmo Numérico',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
      home:  Scaffold(
        appBar: AppBar(
          title: Text('Algoritmo Numérico'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: TarjetaAlgoritmoNumerico(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
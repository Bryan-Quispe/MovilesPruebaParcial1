import 'package:flutter/material.dart';

class TextoResultado extends StatelessWidget {
  final String texto;
  const TextoResultado(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
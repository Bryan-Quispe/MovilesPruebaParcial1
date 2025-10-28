import 'package:flutter/material.dart';

class TextoEtiqueta extends StatelessWidget {
  final String texto;
  const TextoEtiqueta(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'texto_etiquetado.dart';
import 'campo_numero.dart';

class EntradaNumero extends StatelessWidget {
  final int indice;
  final TextEditingController controlador;
  final String error;

  const EntradaNumero({
    super.key,
    required this.indice,
    required this.controlador,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextoEtiqueta('Número ${indice + 1}:'),
        const SizedBox(height: 5),
        CampoNumero(controlador: controlador, textoError: error.isEmpty ? null : error),
        const SizedBox(height: 10),
      ],
    );
  }
}
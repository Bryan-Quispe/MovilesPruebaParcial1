import 'package:flutter/material.dart';
import 'texto_etiquetado.dart';
import 'campo_numero.dart';

class EntradaCantidad extends StatelessWidget {
  final TextEditingController controlador;
  final String error;

  const EntradaCantidad({super.key, required this.controlador, required this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextoEtiqueta('¿Cuántos números desea ingresar? (1-100)'),
        const SizedBox(height: 8),
        CampoNumero(controlador: controlador, textoError: error.isEmpty ? null : error),
      ],
    );
  }
}
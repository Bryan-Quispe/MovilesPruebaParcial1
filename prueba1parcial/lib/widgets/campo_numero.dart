import 'package:flutter/material.dart';

class CampoNumero extends StatelessWidget {
  final TextEditingController controlador;
  final String? textoError;
  final ValueChanged<String>? alCambiar;

  const CampoNumero({
    super.key,
    required this.controlador,
    this.textoError,
    this.alCambiar,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      onChanged: (valor) {
        // SOLO NÚMEROS
        final soloNumeros = valor.replaceAll(RegExp(r'[^0-9]'), '');
        if (valor != soloNumeros) {
          controlador.value = TextEditingValue(
            text: soloNumeros,
            selection: TextSelection.collapsed(offset: soloNumeros.length),
          );
        }
        alCambiar?.call(soloNumeros);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 2)),
        errorText: textoError,
        errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
      ),
    );
  }
}
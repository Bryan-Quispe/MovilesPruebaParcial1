import 'package:flutter/material.dart';

class BotonPrincipal extends StatelessWidget {
  final String texto;
  final VoidCallback alPulsar;
  final bool habilitado;

  const BotonPrincipal({
    super.key,
    required this.texto,
    required this.alPulsar,
    this.habilitado = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: habilitado ? alPulsar : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        disabledBackgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(texto, style: const TextStyle(fontSize: 16)),
    );
  }
}
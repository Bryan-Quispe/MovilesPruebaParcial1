import 'package:flutter/material.dart';
import '../controller/numcontroller.dart';
import '../model/nummodel.dart';
import '../widgets/texto_etiquetado.dart';
import '../widgets/boton_calcular.dart';
import '../widgets/resultado_final.dart';
import '../widgets/entrada_de_cantidad.dart';
import '../widgets/entrada_del_numero.dart';

class TarjetaAlgoritmoNumerico extends StatefulWidget {
  const TarjetaAlgoritmoNumerico({super.key});

  @override
  State<TarjetaAlgoritmoNumerico> createState() => _EstadoTarjeta();
}

class _EstadoTarjeta extends State<TarjetaAlgoritmoNumerico> {
  final TextEditingController _controladorCantidad = TextEditingController();
  final ControladorNumeros _controlador = ControladorNumeros();
  List<TextEditingController> _controladoresNumeros = [];
  List<String> _errores = [];
  String _errorCantidad = '';
  String _resultado = '';
  int _cantidad = 0;
  bool _mostrarEntradas = false;

  @override
  void dispose() {
    _controladorCantidad.dispose();
    for (var c in _controladoresNumeros) c.dispose();
    super.dispose();
  }

  void _validarCantidad() {
    final texto = _controladorCantidad.text;
    if (texto.isEmpty) {
      setState(() => _errorCantidad = 'Ingrese un número');
      return;
    }

    setState(() {
      _errorCantidad = _controlador.validarCantidad(texto);
      if (_errorCantidad.isEmpty) {
        _cantidad = int.parse(texto);
        _controladoresNumeros = List.generate(_cantidad, (_) => TextEditingController());
        _errores = List.filled(_cantidad, '');
        _mostrarEntradas = true;
        _resultado = '';
      } else {
        _mostrarEntradas = false;
      }
    });
  }

  void _procesar() {
    bool hayError = false;
    setState(() {
      _errores = _controladoresNumeros.map((c) {
        final error = _controlador.validarNumero(c.text);
        if (error.isNotEmpty) hayError = true;
        return error;
      }).toList();

      if (!hayError && _controladoresNumeros.every((c) => c.text.isNotEmpty)) {
        final numeros = _controladoresNumeros.map((c) => c.text).toList();
        _controlador.procesarNumeros(_cantidad, numeros);
        final m = _controlador.modelo;

        _resultado = '''
• Menores que 15: ${m.menores15}
• Mayores que 50: ${m.mayores50}
• Entre 25 y 45: ${m.entre25y45}
• Promedio: ${m.promedio.toStringAsFixed(2)}
        '''.trim();
      } else {
        _resultado = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextoEtiqueta('Algoritmo Numérico'),
              const SizedBox(height: 20),
              EntradaCantidad(controlador: _controladorCantidad, error: _errorCantidad),
              const SizedBox(height: 15),
              BotonPrincipal(texto: 'Continuar', alPulsar: _validarCantidad),
              const SizedBox(height: 20),

              if (_mostrarEntradas) ...[
                const Divider(color: Colors.red),
                const TextoEtiqueta('Ingrese los números:'),
                const SizedBox(height: 10),
                ...List.generate(_cantidad, (i) {
                  return EntradaNumero(
                    indice: i,
                    controlador: _controladoresNumeros[i],
                    error: _errores[i],
                  );
                }),
                const SizedBox(height: 15),
                BotonPrincipal(texto: 'Calcular Resultados', alPulsar: _procesar),
                const SizedBox(height: 20),
              ],

              if (_resultado.isNotEmpty) ...[
                const Divider(color: Colors.red),
                const TextoEtiqueta('Resultados:'),
                const SizedBox(height: 10),
                TextoResultado(_resultado),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
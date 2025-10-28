import '../model/nummodel.dart';

class ControladorNumeros {
  late ModeloNumeros modelo;

  ControladorNumeros() {
    modelo = ModeloNumeros();
  }

  String validarCantidad(String texto) {
    final n = int.tryParse(texto);
    if (n == null) return 'Debe ser un número';
    if (n < 1 || n > 100) return 'Debe estar entre 1 y 100';
    return '';
  }

  String validarNumero(String texto) {
    if (texto.isEmpty) return 'Campo requerido';
    final n = int.tryParse(texto);
    if (n == null) return 'Debe ser un número válido';
    return '';
  }

  void procesarNumeros(int cantidad, List<String> textos) {
    final numeros = textos.map(int.parse).toList();
    int menores15 = 0, mayores50 = 0, entre25y45 = 0;
    double suma = 0;

    for (var n in numeros) {
      suma += n;
      if (n < 15) menores15++;
      if (n > 50) mayores50++;
      if (n >= 25 && n <= 45) entre25y45++;
    }

    modelo = ModeloNumeros(
      menores15: menores15,
      mayores50: mayores50,
      entre25y45: entre25y45,
      promedio: suma / cantidad,
    );
  }
}
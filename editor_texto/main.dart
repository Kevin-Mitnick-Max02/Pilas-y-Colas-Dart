import 'dart:io'; // Necesario para leer la entrada del usuario
import 'editor.dart'; // Importar la clase EditorDeTexto

void main() {
  final editor = EditorDeTexto();
  bool ejecutando = true;

  while (ejecutando) {
    print('\n--- Menú del Editor de Texto ---');
    print('1. Escribir línea (añade a la cola de pendientes)');
    print('2. Guardar línea (procesa de la cola a la pila)');
    print('3. Deshacer última línea guardada');
    print('4. Ver historial de líneas guardadas');
    print('5. Ver líneas pendientes');
    print('6. Salir');

    stdout.write('Elige una opción: ');
    final opcion = stdin.readLineSync(); // Lee la entrada del usuario

    switch (opcion) {
      case '1':
        stdout.write('Introduce la línea de texto: ');
        final texto = stdin.readLineSync();
        if (texto != null && texto.isNotEmpty) {
          editor.escribirLinea(texto);
        } else {
          print('La línea no puede estar vacía. Por favor, introduce texto.');
        }
        break;
      case '2':
        editor.guardarLinea();
        break;
      case '3':
        editor.deshacer();
        break;
      case '4':
        editor.verHistorial();
        break;
      case '5':
        editor.verPendientes();
        break;
      case '6':
        ejecutando = false;
        print('Saliendo del editor. ¡Hasta pronto!');
        break;
      default:
        print('Opción no válida. Por favor, elige un número del 1 al 6.');
    }
  }
}

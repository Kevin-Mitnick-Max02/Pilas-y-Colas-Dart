import 'dart:collection'; // Necesario para usar Queue
import 'dart:io'; // Necesario para leer la entrada del usuario

// Clase que simula el editor de texto
class EditorDeTexto {
  // Cola (Queue) para almacenar líneas de texto pendientes por guardar.
  final Queue<String> _lineasPendientes = Queue<String>();
  // Pila (List que actúa como Stack) para guardar el historial de las líneas ya procesadas.
  final List<String> _historialGuardado = [];

  // escribirLinea(String texto): agrega una línea a la cola.
  void escribirLinea(String texto) {
    _lineasPendientes.add(texto);
    print('"${texto}" ha sido añadida a las líneas pendientes.');
  }

  // guardarLinea(): toma la primera línea de la cola y la guarda en la pila.
  void guardarLinea() {
    if (_lineasPendientes.isNotEmpty) {
      final String lineaAGuardar = _lineasPendientes.removeFirst();
      _historialGuardado.add(lineaAGuardar);
      print('"${lineaAGuardar}" ha sido guardada en el historial.');
    } else {
      print('No hay líneas pendientes para guardar.');
    }
  }

  // deshacer(): elimina la última línea guardada (último elemento de la pila).
  void deshacer() {
    if (_historialGuardado.isNotEmpty) {
      final String lineaDeshecha = _historialGuardado.removeLast();
      print('"${lineaDeshecha}" ha sido deshecha del historial.');
    } else {
      print('No hay acciones para deshacer.');
    }
  }

  // verHistorial(): muestra todas las líneas guardadas en orden de inserción.
  void verHistorial() {
    if (_historialGuardado.isNotEmpty) {
      print('\n--- Historial de Líneas Guardadas ---');
      for (int i = 0; i < _historialGuardado.length; i++) {
        print('${i + 1}. ${_historialGuardado[i]}');
      }
      print('-------------------------------------\n');
    } else {
      print('El historial de líneas guardadas está vacío.');
    }
  }

  // verPendientes(): muestra todas las líneas aún no guardadas (contenido de la cola).
  void verPendientes() {
    if (_lineasPendientes.isNotEmpty) {
      print('\n--- Líneas Pendientes ---');
      _lineasPendientes.forEach((linea) {
        print('- $linea');
      });
      print('-------------------------\n');
    } else {
      print('No hay líneas pendientes.');
    }
  }
}

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

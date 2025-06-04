import 'dart:collection'; // Necesario para usar Queue

// Clase que simula el editor de texto
class EditorDeTexto {
  // Cola (Queue) para almacenar líneas de texto pendientes por guardar.
  final Queue<String> _lineasPendientes = Queue<String>();
  // Pila (List que actúa como Stack) para guardar el historial de las líneas ya procesadas.
  final List<String> _historialGuardado = [];

  // Agrega una línea a la cola.
  void escribirLinea(String texto) {
    _lineasPendientes.add(texto);
    print('"${texto}" ha sido añadida a las líneas pendientes.');
  }

  // Toma la primera línea de la cola y la guarda en la pila.
  void guardarLinea() {
    if (_lineasPendientes.isNotEmpty) {
      final String lineaAGuardar = _lineasPendientes.removeFirst();
      _historialGuardado.add(lineaAGuardar);
      print('"${lineaAGuardar}" ha sido guardada en el historial.');
    } else {
      print('No hay líneas pendientes para guardar.');
    }
  }

  // Elimina la última línea guardada (último elemento de la pila).
  void deshacer() {
    if (_historialGuardado.isNotEmpty) {
      final String lineaDeshecha = _historialGuardado.removeLast();
      print('"${lineaDeshecha}" ha sido deshecha del historial.');
    } else {
      print('No hay acciones para deshacer.');
    }
  }

  // Muestra todas las líneas guardadas en orden de inserción.
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

  // Muestra todas las líneas aún no guardadas (contenido de la cola).
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

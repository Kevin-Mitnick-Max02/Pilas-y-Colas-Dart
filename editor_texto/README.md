# Documentación de la Carpeta `editor_texto`

Esta carpeta contiene el código fuente para una simple aplicación de editor de texto en Dart que utiliza estructuras de datos de Pilas y Colas.

## Archivos

-   `editor.dart`: Define la lógica principal del editor de texto.
-   `main.dart`: Contiene la función principal para ejecutar la aplicación e interactuar con el usuario.

## `editor.dart`

Este archivo define la clase `EditorDeTexto`, que simula las funcionalidades básicas de un editor utilizando las siguientes estructuras de datos:

-   **Cola (`Queue<String> _lineasPendientes`):** Se utiliza para almacenar las líneas de texto que el usuario ha escrito pero que aún no ha "guardado". Las líneas se añaden al final de la cola y se procesan desde el principio (FIFO - First-In, First-Out).
-   **Pila (`List<String> _historialGuardado`):** Una lista que se utiliza como una pila para almacenar las líneas de texto una vez que han sido "guardadas" desde la cola. Las líneas se añaden al final de la lista (simulando un push) y se eliminan también del final (simulando un pop) para la funcionalidad de deshacer (LIFO - Last-In, First-Out).

### Métodos de la Clase `EditorDeTexto`:

-   `escribirLinea(String texto)`: Añade la línea de texto proporcionada al final de la cola `_lineasPendientes`.
-   `guardarLinea()`: Mueve la primera línea de `_lineasPendientes` al final de la lista `_historialGuardado`. Si la cola está vacía, muestra un mensaje.
-   `deshacer()`: Elimina la última línea añadida a `_historialGuardado`. Si la pila está vacía, muestra un mensaje.
-   `verHistorial()`: Imprime todas las líneas actualmente en `_historialGuardado` en el orden en que fueron guardadas.
-   `verPendientes()`: Imprime todas las líneas actualmente en `_lineasPendientes`.

## `main.dart`

Este archivo contiene la función `main`, que es el punto de entrada de la aplicación. Es responsable de:

1.  Importar las librerías necesarias (`dart:collection`, `dart:io`) y la clase `EditorDeTexto` desde `editor.dart`.
2.  Crear una instancia de `EditorDeTexto`.
3.  Presentar un menú de opciones al usuario en la terminal.
4.  Leer la entrada del usuario para determinar la acción a realizar.
5.  Llamar al método apropiado de la instancia de `EditorDeTexto` según la opción elegida por el usuario.
6.  Continuar el bucle hasta que el usuario elija la opción de salir.

### Flujo del Programa:

-   El programa inicia en la función `main`.
-   Se crea un objeto `editor` de la clase `EditorDeTexto`.
-   Se muestra un menú interactivo al usuario.
-   El usuario ingresa un número para seleccionar una opción.
-   Según la opción, se llama al método correspondiente del objeto `editor`.
-   Las operaciones de escribir, guardar y deshacer modifican las estructuras internas (cola y pila) del objeto `editor`.
-   Las opciones de ver muestran el estado actual de la cola y la pila.
-   El bucle continúa hasta que se selecciona la opción de salir.

## Cómo Funcionan Juntos

El archivo `main.dart` importa la clase `EditorDeTexto` definida en `editor.dart`. Esto permite que el código en `main.dart` cree y manipule objetos de tipo `EditorDeTexto`, utilizando la lógica y las estructuras de datos definidas en el otro archivo. `main.dart` actúa como la interfaz de usuario de terminal, mientras que `editor.dart` proporciona la lógica de negocio subyacente.

## Cómo Ejecutar el Programa

Para ejecutar esta aplicación de editor de texto:

1.  Abre una terminal o línea de comandos.
2.  Navega hasta la carpeta `editor_texto`.
3.  Ejecuta el siguiente comando:
    ```bash
    dart run main.dart
    ```
4.  El programa mostrará el menú, y podrás interactuar con el editor ingresando los números de las opciones.

Esta documentación debería proporcionar una comprensión clara de la estructura y el funcionamiento de los archivos `editor.dart` y `main.dart`. 
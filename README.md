# fondeadora

App de frase del día de Fondeadora.

## inicio

Este proyecto está desarrollado con Flutter en una estructura MVC.

Para poder correr el proyecto:
- flutter pub get
- flutter run

Para entrar debes ingresar un email válido y cualquier contraseña mayor a 5 carácteres.

Cada día obtendrás una frase distinta desde (https://quotes.rest)

Para poder correr los tests:
- flutter test test/user.dart (UserController unit test)
- flutter test test/quote.dart (Quote instance desde factory)
- flutter test test/login.dart (Login pantalla widget test)

Toma de decisión de programación:
- Controladores:
  - quote: define los headers y hace la llamada para obtener la frase desde la API de quote.rest
  - user: 
    - indica si un usuario está logueado o no y quien es ese usuario.
    - permite ingresar y cerrar sesión
- Modelos:
  - quote: define la información necesaria para una frase y permite que se defina mediante un factory desde un json
  - user: define la información que traerá un usuario
- Vistas:
  - home: pantalla principal donde se muestra la frase
  - login: pantalla de formulario para loguarse
  - welcome: pantalla de inicio
- Widgets:
  - author: widget utilizado en home para dar formato al nombre del autor
  - email: widget que da formato a email logueado

Toma de decisión de diseño:
- Pantalla inicial al estilo de la tarjeta física de fondeadora
- Pantalla de ingreso con diseño limpio, los campos y botón de acceso ubicados en la parte inferior para facilitar el acceso al usuario.
- En caso de introducir un email no válido o contraseña menor a 5 caracteres te indicará el error en el campo indicado, en caso contrario continuará con el ingreso.
- Para la pantalla principal de nuevo un diseño limpio y llamativo que enfoque principalmente a la frase del día y destaque en segundo plano al autor de la misma.
- Un ícono en la parte superior te permitirá cerrar tu sesión y regresar a la pantalla inicial.
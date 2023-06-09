# prueba_application

A new Flutter project.

Este proyecto: 
- Implementa el inicio de session con google mediante Firebase.
- Implementa un consumo de api mediante dio.
- Implementa una gestion de estados mediante provider.

## 1. Pasos para su ejecucion
- Ejecutar el comando "flutter clean" para realizar una ejecucion limpia.
- Ejecutar el comando "flutter pub get" para cargar las librerias indispensables de la aplicacion.
- Ejecutar el comando "flutter run" para correr en un dispositivo no te olvides de seleccionar el dispositivo que desee.

## 2. Librerias utilizadas
 - flutter_svg: ^2.0.3 
 - dio: ^5.2.0+1
 - provider: ^6.0.5
 - intl: ^0.17.0
 - dots_indicator: ^3.0.0
 - firebase_core: ^2.13.1
 - firebase_auth: ^4.6.2
 - google_sign_in: ^6.1.4
 - fluttertoast: ^8.2.2

Uso:
- Se utilizo provider para la gestion de estados por el uso que se a lo largo del tiempo.
- Se utilizo dio en vez de http por la preferencia, nada mas.
- Se utlizo svg para no perder la calidad de los iconos de la aplciacion.
- Se utilizo dots indicator para simular la transicion de un carousell.
- Se utlizo flutter_toast para una muestra de mensajes al realizar alguna accion.

Descripcion:

- flutter_svg (versión 2.0.3): Esta biblioteca te permite renderizar imágenes vectoriales (SVG) en tu aplicación Flutter. Proporciona un widget llamado SvgPicture que carga y muestra imágenes SVG.

- dio (versión 5.2.0+1): Es una biblioteca de cliente HTTP para Flutter que facilita las solicitudes HTTP, incluyendo la gestión de encabezados, parámetros, solicitudes multipartes, autenticación, etc. Es una alternativa popular a la biblioteca http de Flutter.

- provider (versión 6.0.5): Es una biblioteca que ofrece un mecanismo sencillo para administrar el estado en Flutter. Permite compartir y acceder a datos y estados en diferentes partes de la aplicación de manera eficiente, utilizando el patrón de diseño Provider.

- intl (versión 0.17.0): Proporciona soporte para internacionalización y localización en Flutter. Permite formatear y mostrar fechas, números, monedas y otros datos en diferentes idiomas y regiones.

- dots_indicator (versión 3.0.0): Es una biblioteca que proporciona un indicador de puntos personalizable para indicar la posición actual en una lista o carrusel. Es útil para mostrar la paginación en una vista desplazable.

- firebase_core (versión 2.13.1): Es una biblioteca de Firebase que proporciona funcionalidades básicas y de inicialización para las aplicaciones Flutter que utilizan Firebase. Es necesario para usar otros servicios de Firebase en tu aplicación.

- firebase_auth (versión 4.6.2): Es una biblioteca de Firebase que brinda autenticación de usuarios para aplicaciones Flutter. Permite autenticar a los usuarios mediante diferentes métodos, como correo electrónico/contraseña, autenticación de Google, autenticación de Facebook, etc.

- google_sign_in (versión 6.1.4): Es una biblioteca que proporciona la funcionalidad de inicio de sesión con Google en Flutter. Permite autenticar a los usuarios utilizando sus credenciales de Google y acceder a la información de su perfil.

- fluttertoast (versión 8.2.2): Es una biblioteca que permite mostrar notificaciones emergentes (toasts) en Flutter. Puedes mostrar mensajes cortos o informativos en forma de pop-up en la parte inferior de la pantalla.

## 3. Arquitectura realizada 

Clean Arquitecture:

- src/
-  data  /services
-  domain  /models
-  helpers
-  presentation   /screen/widget
-                 /providers
-  routes
  
  
  Se utilizo una parte de clean arquitectura para mejor estructura del proyecto.
  
  ## 4. Capturas
  
![1](https://github.com/JhonaOch/SHF_prueba/assets/34308770/37dd07c2-3163-4df4-8b19-5838c9a30c6c)
![2](https://github.com/JhonaOch/SHF_prueba/assets/34308770/eab88d80-3641-4c9c-bef6-259964af7501)
![3](https://github.com/JhonaOch/SHF_prueba/assets/34308770/d6e6f643-46c6-4292-ad2b-a9edc96de16a)
![4](https://github.com/JhonaOch/SHF_prueba/assets/34308770/0efa49cd-0fc6-4311-a330-dc7a618c69f1)
![5](https://github.com/JhonaOch/SHF_prueba/assets/34308770/7f534c6c-0045-4660-b77d-38905c3cc216)
![6](https://github.com/JhonaOch/SHF_prueba/assets/34308770/aa8a1b01-c371-49b9-8951-878a5efc19db)
![7](https://github.com/JhonaOch/SHF_prueba/assets/34308770/7e48f475-43d0-40a0-9b83-cc6c20f0d7ac)
![8](https://github.com/JhonaOch/SHF_prueba/assets/34308770/debcabb8-a6a0-42a5-b262-335b079e6970)
![9](https://github.com/JhonaOch/SHF_prueba/assets/34308770/8c27d688-a357-48d8-bea9-82573e3c82c8)
![10](https://github.com/JhonaOch/SHF_prueba/assets/34308770/ddc51ad0-13b9-4358-9b14-7aec25943c18)




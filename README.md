# Proyecto de Superhéroes usando Flutter

Este es un proyecto de ejemplo para crear una aplicación móvil de superhéroes utilizando el framework Flutter, la arquitectura MVVM y el paquete Riverpod. La versión de Flutter utilizada en este proyecto es la 3.7.

## Arquitectura

Para este proyecto, utilizaremos la arquitectura MVVM (Modelo Vista Vista Modelo) para separar la lógica de la aplicación de la interfaz de usuario. La idea principal de la arquitectura MVVM es separar la lógica de presentación de la lógica de negocio, para que cada componente tenga una responsabilidad clara.

## Paquetes y Dependencias

- Flutter 3.7
- Riverpod
- http
- lottie

## Uso de Riverpod

En este proyecto utilizaremos Riverpod para manejar la inyección de dependencias y el estado global de la aplicación. La clase `SuperheroesViewModel` será registrada como un proveedor en el árbol de proveedores de Riverpod y será utilizada en las pantallas de la aplicación.

## Uso de la API pública

En este proyecto utilizaremos la API pública `https://superheroapi.com` para obtener información sobre superhéroes. Utilizaremos el paquete `http` de Flutter para hacer peticiones a la API. Para utilizar esta API es necesario obtener una `API key` registrándose en la página web de SuperHeroAPI.

## Descarga

Puedes descargar la aplicación desde este enlace:

[Super Hero App](https://drive.google.com/file/d/1n9iETSwMnnACnq9cmk_sLXAurrZqZsUo/view?usp=sharing)
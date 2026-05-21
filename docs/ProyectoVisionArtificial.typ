#set page(paper: "a4", margin: 2cm)
#set text(font: "arial", size: 12pt)

#align(center)[
  #v(1fr)

  #image("logo1.png", width: 25%)

  #v(1.5em)

  #text(size: 16pt)[*Universidad de Guadalajara*] \
  #v(1em)
  #text(size: 18pt)[*CENTRO UNIVERSITARIO DE LA COSTA*] \
  #v(0.5em)
  #text(size: 16pt)[_INGENIERIA EN COMPUTACION_]

  #v(3fr)

  #text(size: 24pt)[*Interacción Humano Computadora:*] \
  #v(0.5em)
  #text(size: 20pt)[*_Sistema Inteligente de Interacción Gestual con Visión Artificial_*]

  #v(3fr)

  #text(size: 16pt)[*QUE PRESENTA*] \
  #v(0.25em)
  #[
    #set list(marker: "", body-indent: 0pt)
    - #text(size: 16pt)[Diego Emmanuel Rodriguez Ruvalcaba]
    - #text(size: 16pt)[Karol Jimena Marquez Gutierrez]
    - #text(size: 16pt)[Daniela Jessica Blanco]
    - #text(size: 16pt)[]
  ]

  #v(1.5em)

  #text(size: 16pt)[*Maestro*] \
  #v(0.25em)
  #text(size: 16pt)[Eduardo Ruben Hernandez Gonzalez]

  #v(3fr)

  #image("logo2.png", width: 50%)

  #v(1fr)
]

#pagebreak()

#set page(numbering: "1", number-align: center)
#counter(page).update(1)
#set par(justify: true, leading: 0.8em, first-line-indent: 1.5em)
#set heading(numbering: "1.1")
#show heading: it => [
  #v(0.5em)
  #it
  #v(0.3em)
]

= Descripción y Funcionamiento del Sistema

El proyecto consiste en el diseño e implementación de un sistema interactivo basado en visión artificial que permite el control de procesos mediante gestos manuales. El sistema utiliza una cámara para capturar video en tiempo real, procesando cada cuadro para identificar la presencia de una mano y determinar su postura.

La lógica de control se basa en el conteo de dedos levantados. Cuando el sistema detecta una *mano abierta* (4 o más dedos levantados), se activa el modo de reconocimiento de objetos mediante el modelo YOLOv8, permitiendo la identificación de elementos en el entorno. Por el contrario, al detectar un *puño cerrado* (0 dedos levantados), el sistema entra en un estado de pausa o "apagado", deteniendo el procesamiento intensivo de detección de objetos.

Esta arquitectura busca optimizar la interacción usuario-máquina (UX), proporcionando un método natural y fluido de control sin necesidad de dispositivos de entrada tradicionales, mapeando gestos directos a estados lógicos del software y actuadores físicos como el ESP32Cam.

#v(1em)
#block(
  width: 100%,
  height: 8cm,
  stroke: 1pt + gray,
  fill: luma(240),
  inset: 1em,
  align(center + horizon)[
    #text(
      style: "italic",
      fill: gray,
    )[Espacio reservado para fotografía del sistema en funcionamiento (Detección de gestos)]
  ],
)
#v(1em)

= Tecnologías Usadas y Requerimientos

Para la realización de este sistema inteligente se han integrado diversas tecnologías de vanguardia en el campo de la visión artificial y el desarrollo de software:

- *Python:* Lenguaje de programación principal debido a su robustez y amplia ecosistema de librerías para IA.
- *OpenCV:* Utilizado para la captura de video, preprocesamiento de imágenes y visualización de la interfaz gráfica.
- *MediaPipe:* Framework de Google empleado para la detección y seguimiento de puntos de referencia de la mano (Hand Landmarking) con alta precisión y baja latencia.
- *YOLOv8 (Ultralytics):* Modelo de aprendizaje profundo de última generación utilizado para la detección de objetos en tiempo real cuando el sistema está activo.
- *ESP32Cam:* Empleado como actuador físico para la integración de respuestas en el mundo real (LEDs, sensores, etc.).

== Síntesis de Requerimientos

El sistema debe cumplir con los siguientes estándares técnicos y de diseño:
1. *Detección en Tiempo Real:* El procesamiento debe ser lo suficientemente rápido para no entorpecer la experiencia del usuario.
2. *Mapeo de Gestos:* Definición clara de estados (Mano abierta = Encender, Puño = Apagar).
3. *Interfaz Intuitiva (UX):* Visualización clara del estado actual del sistema (Activado/Pausado) mediante elementos gráficos en pantalla.
4. *Integración de Hardware:* Comunicación efectiva entre el script de procesamiento y el controlador ESP32.

#v(1em)
#block(
  width: 100%,
  height: 8cm,
  stroke: 1pt + gray,
  fill: luma(240),
  inset: 1em,
  align(center + horizon)[
    #text(style: "italic", fill: gray)[Espacio reservado para fotografía de la integración técnica y tecnologías]
  ],
)

# Proyecto de Reconocimiento Gestual con YOLOv8

Este proyecto utiliza **OpenCV**, **Mediapipe** y **YOLOv8** para realizar detección de objetos activada mediante gestos manuales capturados desde una cámara (configurado para usar la Cámara Virtual de OBS).

## Requisitos Previos

- Python 3.8 o superior.
- [OBS Studio](https://obsproject.com/) (para la cámara virtual).

## Instalación y Configuración

Sigue estos pasos para configurar el proyecto en tu máquina local:

### 1. Clonar el Repositorio

Abre una terminal y ejecuta el siguiente comando (reemplaza los valores en mayúsculas con los tuyos):

```bash
git clone https://github.com/MrMikeDevTech/ProyectoDeReconocimientoGestual.git
cd ProyectoDeReconocimientoGestual
```

### 2. Crear el Entorno Virtual

Es recomendable usar un entorno virtual para mantener las dependencias aisladas:

```bash
# En Windows
python -m venv venv
```

### 3. Activar el Entorno Virtual

```bash
# En Windows (PowerShell)
.\venv\Scripts\Activate.ps1

# O en Windows (CMD)
.\venv\Scripts\activate.bat
```

### 4. Instalar Dependencias

Con el entorno virtual activo, instala las librerías necesarias:

```bash
pip install -r requirements.txt
```

## Configuración de la Cámara Virtual de OBS

Para que el script reciba la señal de OBS, sigue estos pasos:

1. Abre **OBS Studio**.
2. Configura tus fuentes (cámara web, capturas de pantalla, etc.) en la escena deseada.
3. En el panel de "Controles" (abajo a la derecha), haz clic en **Iniciar Cámara Virtual**.
4. En el archivo `index.py`, asegúrate de que la variable `CAMARA` coincida con el índice de la cámara virtual (usualmente `1` si es la única cámara virtual activa, pero puede variar).

## Ejecución del Proyecto

Para iniciar la aplicación, ejecuta:

```bash
python index.py
```

### Controles Gestuales:
- **Mano Abierta (4 dedos levantados):** Activa la detección de YOLOv8.
- **Puño Cerrado (0 dedos levantados):** Pausa la detección de YOLOv8.
- **Tecla 'q':** Cierra la aplicación.

---

## Integrantes del equipo

- Diego Emmanuel Rodriguez Ruvalcaba
- Karol Jimena Marquez Gutierrez
- Daniela Jessica Blanco
- 

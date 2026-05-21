import cv2
import mediapipe as mp
from ultralytics import YOLO 

CAMARA = 1  # OBS Virtual Camera

mp_hands = mp.solutions.hands
mp_draw = mp.solutions.drawing_utils
hands = mp_hands.Hands(max_num_hands=1, min_detection_confidence=0.7)

modelo_yolo = YOLO('yolov8n.pt') 

def detectar_gesto(landmarks):
    tips = [8, 12, 16, 20]
    dedos_levantados = sum(1 for tip in tips if landmarks.landmark[tip].y < landmarks.landmark[tip - 2].y)

    if dedos_levantados == 4:
        return "ENCENDIDO"
    elif dedos_levantados == 0:
        return "APAGADO"
    return None

cap = cv2.VideoCapture(CAMARA)

estado_deteccion = False

while True:
    ret, frame = cap.read()
    
    if not ret:
        print("No se detectó cámara, prueba otro índice")
        break

    frame = cv2.flip(frame, 1)
    rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    
    resultado = hands.process(rgb)

    if resultado.multi_hand_landmarks:
        for hand_landmarks in resultado.multi_hand_landmarks:
            mp_draw.draw_landmarks(frame, hand_landmarks, mp_hands.HAND_CONNECTIONS)
            gesto = detectar_gesto(hand_landmarks)

            if gesto == "ENCENDIDO":
                estado_deteccion = True
            elif gesto == "APAGADO":
                estado_deteccion = False

    if estado_deteccion:
        resultados_yolo = modelo_yolo(frame, verbose=False)
        
        frame = resultados_yolo[0].plot()

        cv2.putText(frame, "YOLO: ACTIVADO", (10, 40),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.8, (0, 255, 0), 2)
    else:
        cv2.putText(frame, "YOLO: PAUSADO (Muestra la mano abierta para activar)", (10, 40),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 0, 255), 2)

    cv2.imshow("Control Gestual + YOLOv8", frame)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()

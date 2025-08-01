---
sidebar_position: 3
---

# IA con MediaPipe

## MediaPipe Pose

### Keypoints Detectados
- 33 puntos corporales en 3D
- Coordenadas normalizadas (0-1)
- Confidence score por punto

### Evaluaciones Implementadas

#### Postura Estática
```python
def analyze_static_posture(landmarks):
    # Simetría de hombros
    shoulder_symmetry = calculate_shoulder_level(landmarks)
    
    # Alineación de caderas  
    hip_alignment = calculate_hip_alignment(landmarks)
    
    return PostureAnalysis(
        shoulder_symmetry=shoulder_symmetry,
        hip_alignment=hip_alignment
    )
```

#### Rangos Articulares
```python  
def calculate_joint_angles(landmarks):
    # Flexión de cadera
    hip_flexion = angle_between_points(
        landmarks.hip, 
        landmarks.knee, 
        landmarks.ankle
    )
    
    return JointAngles(hip_flexion=hip_flexion)
```

## Pipeline de Procesamiento

1. **Input**: Video/imagen desde móvil
2. **Preprocessing**: Resize, normalize
3. **MediaPipe**: Extracción de keypoints
4. **Analysis**: Cálculos biomecánicos  
5. **Scoring**: Evaluación clínica
6. **Output**: Resultado estructurado

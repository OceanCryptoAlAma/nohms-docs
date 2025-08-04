---
sidebar_position: 5
---

# Validación Pre-MVP: Pruebas de IA para Evaluación Funcional

Antes de desarrollar el MVP completo, es fundamental validar la viabilidad técnica de los modelos de pose estimation aplicados al análisis de evaluaciones funcionales humanas. Esta fase de validación nos permitirá tomar decisiones fundamentadas sobre arquitectura, modelos y pipeline de datos, minimizando riesgos técnicos y optimizando recursos de desarrollo.

---

## 🎯 Objetivo General

**Validar la viabilidad técnica** de aplicar modelos de pose estimation por IA al análisis de evaluaciones funcionales humanas, específicamente dentro del contexto del protocolo EPN® NOHMS®. 

### **Objetivos Específicos:**
- Determinar qué modelo de IA ofrece mejor precisión para evaluaciones NOHMS®
- Identificar limitaciones técnicas y casos edge críticos
- Establecer benchmarks de performance mínimos para el MVP
- Validar pipeline de procesamiento de datos anonimizado
- Cuantificar recursos computacionales necesarios

---

## 🔍 Evaluaciones Seleccionadas para Validación

### **Subset Estratégico (5 de 33 Tests NOHMS®)**

#### **1. Sentadilla Profunda**
- **Objetivo**: Movilidad de cadera, tobillo y estabilidad del core
- **Keypoints críticos**: Rodillas, caderas, tobillos, columna vertebral
- **Compensaciones a detectar**: Valgo de rodillas, pérdida de talones, inclinación excesiva del tronco

#### **2. Flexión Lumbar Secuencial** ("Enderezamiento Vertebral")
- **Objetivo**: Movilidad segmentaria de columna vertebral
- **Keypoints críticos**: Vértebras cervicales, torácicas y lumbares
- **Compensaciones a detectar**: Flexión en bloque, pérdida de curvatura cervical

#### **3. Desplante Lateral**
- **Objetivo**: Estabilidad y movilidad unilateral de cadera
- **Keypoints críticos**: Rodilla de apoyo, cadera, pelvis, pie de soporte
- **Compensaciones a detectar**: Valgo dinámico, desplazamiento medial de rodilla

#### **4. Equilibrio en una Pierna con Flexión**
- **Objetivo**: Control propioceptivo y estabilidad dinámica
- **Keypoints críticos**: Tobillo de apoyo, rodilla, cadera, control de brazos
- **Compensaciones a detectar**: Oscilaciones excesivas, compensación con brazos

#### **5. Lomos de Gato**
- **Objetivo**: Movilidad controlada de columna vertebral
- **Keypoints críticos**: Toda la cadena vertebral, pelvis, escapulas
- **Compensaciones a detectar**: Movimiento en bloque, asimetrías laterales

---

## 📹 Protocolo de Material de Prueba

### **Especificaciones Técnicas de Grabación**
| Parámetro | Especificación | Justificación |
|-----------|----------------|---------------|
| **Sujetos** | 3-5 personas diversas | Variabilidad antropométrica inicial |
| **Videos por evaluación** | 5 total (1 por sujeto) | Cobertura de casos diversos |
| **Resolución** | 1080p mínimo | Precisión en detección de keypoints |
| **FPS** | 30 fps | Balance calidad/procesamiento |
| **Duración** | 15-30 segundos | Captura completa del patrón |
| **Ángulos** | Frontal + perfil | Análisis 2D/3D completo |

### **Condiciones de Grabación Controladas**
#### **Entorno:**
- **Fondo**: Neutro, sin patrones complejos
- **Iluminación**: Uniforme, sin sombras marcadas
- **Espacio**: 3x3 metros mínimo para movimientos completos
- **Distancia cámara**: 2-3 metros del sujeto
- **Altura cámara**: Nivel del torso del sujeto

#### **Privacidad:**
- **Rostro**: Pixelado o eliminado digitalmente
- **Identificadores**: Remoción de elementos identificatorios
- **Consentimiento**: Protocolo de consentimiento informado para uso de datos

### **Diversidad de Casos de Prueba**
#### **Antropométrica:**
- Diferentes alturas y composiciones corporales
- Rango de edad: 25-55 años
- Balance de género: masculino/femenino

#### **Calidad de Movimiento:**
- **Ejecución óptima**: Movimiento técnicamente correcto
- **Compensaciones leves**: Disfunciones menores evidentes
- **Compensaciones marcadas**: Patrones claramente alterados

#### **Condiciones Variables:**
- **Vestimenta**: Ropa ajustada vs deportiva holgada
- **Calzado**: Descalzo vs calzado deportivo
- **Iluminación**: Condiciones ideales vs subóptimas

---

## 🧠 Modelos de IA a Evaluar

### **1. MediaPipe Pose**
- **Tipo**: 2D pose estimation
- **Ventajas**: Open source, optimizado, real-time
- **Herramientas**: Demo oficial Google, Python SDK
- **Keypoints**: 33 puntos corporales

### **2. MoveNet**
- **Tipo**: 2D pose estimation (Thunder/Lightning)
- **Ventajas**: Alta precisión, optimizado para TensorFlow
- **Herramientas**: TensorFlow Hub + Colab Notebooks
- **Keypoints**: 17 puntos corporales clave

### **3. OpenPose**
- **Tipo**: 2D/3D pose estimation
- **Ventajas**: Muy preciso, full body + hands + face
- **Herramientas**: Repositorio oficial, Docker container
- **Keypoints**: 25 puntos corporales + 21 por mano

### **4. BlazePose 3D**
- **Tipo**: 3D full-body pose estimation
- **Ventajas**: Información volumétrica, MediaPipe integration
- **Herramientas**: Colab demo con modelo GHUM
- **Keypoints**: 33 puntos con coordenadas Z

### **5. PoseBERT (Opcional)**
- **Tipo**: Sequence-based pose analysis
- **Ventajas**: Análisis temporal avanzado
- **Herramientas**: Paper + GitHub implementation
- **Aplicación**: Tracking de secuencias completas

---

## ✅ Criterios de Evaluación Detallados

### **Métricas Cuantitativas**
#### **Precisión de Detección:**
- **Coverage Rate**: % de frames con detección completa de keypoints críticos
- **Keypoint Accuracy**: Precisión por keypoint individual (cuando ground truth disponible)
- **Temporal Consistency**: Varianza de posición por keypoint entre frames consecutivos
- **Missing Data Rate**: % de keypoints perdidos por evaluación

#### **Performance Técnico:**
- **Latencia**: Milisegundos por frame procesado
- **Throughput**: Frames por segundo (FPS) sostenidos
- **Recursos**: CPU/GPU/RAM utilizados durante procesamiento
- **Escalabilidad**: Performance con múltiples streams simultáneos

### **Métricas Cualitativas**
#### **Robustez del Modelo:**
- **Jitter/Ghosting**: Estabilidad temporal de keypoints
- **Occlusion Handling**: Manejo de auto-oclusiones corporales
- **Clothing Robustness**: Performance con diferentes tipos de vestimenta
- **Lighting Tolerance**: Robustez ante variaciones de iluminación

#### **Relevancia Funcional:**
- **Critical Keypoint Reliability**: Fiabilidad de puntos clave para cada evaluación
- **Compensation Detection**: Capacidad de detectar patrones compensatorios
- **Movement Continuity**: Seguimiento fluido de transiciones dinámicas
- **Angular Precision**: Precisión en cálculo de ángulos articulares críticos

---

## 📊 Metodología de Evaluación

### **Fase 1: Configuración del Entorno**
#### **Setup Técnico:**
```bash
# Entorno base para pruebas
- Python 3.9+
- CUDA 11.8+ (para modelos que requieren GPU)
- Docker para OpenPose
- Jupyter Lab para notebooks interactivos
- Librerías: OpenCV, NumPy, Matplotlib, Pandas
```

#### **Estructura de Datos:**
```
validacion_pre_mvp/
├── videos_raw/
│   ├── sujeto_01/
│   │   ├── sentadilla_frontal.mp4
│   │   ├── sentadilla_perfil.mp4
│   │   └── ...
├── resultados/
│   ├── mediapipe/
│   ├── movenet/
│   └── openpose/
├── notebooks/
│   ├── 01_mediapipe_analysis.ipynb
│   ├── 02_movenet_analysis.ipynb
│   └── ...
└── scripts/
    ├── batch_processing.py
    ├── metrics_calculator.py
    └── comparison_generator.py
```

### **Fase 2: Procesamiento Automatizado**
#### **Pipeline de Análisis:**
1. **Preprocessing**: Normalización de videos, recorte temporal
2. **Pose Estimation**: Extracción de keypoints con cada modelo
3. **Quality Assessment**: Validación de completitud y consistency
4. **Metrics Calculation**: Cálculo automatizado de métricas
5. **Comparative Analysis**: Generación de comparativas lado a lado

### **Fase 3: Análisis Comparativo**
#### **Matriz de Decisión:**
```markdown
| Criterio | Peso | MediaPipe | MoveNet | OpenPose | BlazePose |
|----------|------|-----------|---------|----------|-----------|
| Precisión | 30% | 8.5 | 9.0 | 9.5 | 8.0 |
| Performance | 25% | 9.0 | 8.5 | 6.0 | 7.5 |
| Robustez | 20% | 8.0 | 8.5 | 9.0 | 7.0 |
| Facilidad | 15% | 9.5 | 8.0 | 6.5 | 8.5 |
| Escalabilidad | 10% | 9.0 | 8.5 | 7.0 | 8.0 |
| **TOTAL** | 100% | **8.65** | **8.55** | **7.65** | **7.75** |
```

---

## 📈 Resultado Esperado: Informe Ejecutivo

### **Tabla Resumen por Evaluación**
| Evaluación | Modelo Recomendado | Keypoints OK | Limitaciones | Precisión | Apto MVP | Notas |
|------------|-------------------|--------------|--------------|-----------|----------|--------|
| **Sentadilla** | MediaPipe | Rodillas, caderas, tobillos | Pierde tobillo izq. ocasional | 85% | ✅ Sí | Excelente para ángulos críticos |
| **Enderezamiento** | MoveNet | Columna vertebral completa | Jitter leve en cervicales | 88% | ✅ Sí | Mejor para secuencias temporales |
| **Desplante** | OpenPose | Detección completa | Requiere GPU, lento | 92% | ⚠️ Condicional | Alta precisión, alto costo |
| **Equilibrio** | BlazePose 3D | Estabilidad 3D excelente | Complejidad computacional | 80% | ✅ Sí | 3D añade valor para balance |
| **Lomos Gato** | MediaPipe | Tracking fluido | Pérdida en transiciones | 83% | ✅ Sí | Robusto para movimiento continuo |

### **Recomendación Final**
#### **Stack Tecnológico Propuesto:**
- **Modelo Primario**: MediaPipe Pose (balance óptimo)
- **Modelo Secundario**: MoveNet Thunder (validación cruzada)
- **Casos Especiales**: BlazePose 3D para evaluaciones de equilibrio

#### **Pipeline de Producción:**
```
[Video Input] → [MediaPipe Processing] → [MoveNet Validation] → [Consensus Algorithm] → [Results]
```

---

## 🔄 Siguientes Pasos Post-Validación

### **Decisiones Técnicas Inmediatas**
1. **Selección de modelos** para desarrollo MVP
2. **Definición de arquitectura** de procesamiento
3. **Especificaciones de hardware** mínimo y recomendado
4. **Protocolo de captura** definitivo para usuarios

### **Preparación para MVP**
1. **Dataset de entrenamiento**: Escalado a 200+ videos
2. **Pipeline de etiquetado**: Herramientas para anotación manual
3. **Métricas de calidad**: Umbrales mínimos para aceptación automática
4. **Fallback procedures**: Protocolo cuando IA falla

### **Iteración Continua**
1. **A/B testing** de modelos en producción
2. **Feedback loop** de usuarios y profesionales
3. **Mejora continua** basada en casos reales
4. **Scaling strategy** para volumen de producción

---

## 📎 Anexos Técnicos

### **A. Scripts de Prueba**
- Notebooks Jupyter para cada modelo
- Scripts de procesamiento batch
- Calculadoras de métricas automatizadas
- Generadores de reportes comparativos

### **B. Protocolos de Privacidad**
- Consentimiento informado para grabaciones
- Procedimientos de anonimización
- Eliminación segura de datos personales
- Cumplimiento GDPR en fase de pruebas

### **C. Enlaces de Referencia**
- [MediaPipe Pose Documentation](https://mediapipe.dev/solutions/pose)
- [MoveNet TensorFlow Hub](https://tfhub.dev/google/movenet/)
- [OpenPose GitHub Repository](https://github.com/CMU-Perceptual-Computing-Lab/openpose)
- [BlazePose Research Paper](https://arxiv.org/abs/2006.10204)

---

Esta validación pre-MVP es **crítica para el éxito del proyecto**, ya que nos permite tomar decisiones técnicas fundamentadas, minimizar riesgos de desarrollo y optimizar la inversión en recursos computacionales y humanos.

*"Measure twice, cut once" - La validación técnica rigurosa es la base de un MVP exitoso.*

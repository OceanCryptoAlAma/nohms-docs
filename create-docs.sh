#!/bin/bash

# Script para crear toda la estructura de documentos de NOHMS.One
# Ejecutar desde el directorio raíz de nohms-docs

echo "🚀 Creando estructura de documentos para NOHMS.One..."

# Crear directorios
echo "📁 Creando directorios..."
mkdir -p docs/metodologia/evaluaciones
mkdir -p docs/plataforma/modulos  
mkdir -p docs/desarrollo
mkdir -p docs/negocio
mkdir -p docs/comunidad
mkdir -p static/img/evaluaciones
mkdir -p static/videos
mkdir -p static/docs

# Crear archivos de metodología
echo "📚 Creando documentos de metodología..."
cat > docs/metodologia/introduccion.md << 'EOF'
---
sidebar_position: 1
---

# Introducción a la Metodología NOHMS®

La metodología NOHMS® es un sistema integral de evaluación psicokinética desarrollado por Nicolás Ogues, diseñado para evaluar y mejorar la movilidad humana a través de protocolos precisos y validados clínicamente.

## Fundamentos

- Evaluación funcional integral
- Análisis postural detallado  
- Detección de compensaciones
- Planes personalizados de mejora

## Objetivo

Recuperar la libertad de movimiento natural que teníamos de niños: agacharse, levantarse, girar, estirarse sin dolor ni restricciones.
EOF

cat > docs/metodologia/protocolos.md << 'EOF'
---
sidebar_position: 3
---

# Protocolos NOHMS®

Documentación completa de los protocolos de evaluación y seguimiento.

## Protocolo de Evaluación

- Entrevista inicial
- Evaluaciones posturales
- Registro fotográfico
- Análisis de resultados

## Protocolo de Seguimiento

- Reevaluaciones periódicas
- Ajustes de plan
- Evolución documentada
EOF

cat > docs/metodologia/validacion-clinica.md << 'EOF'
---
sidebar_position: 4
---

# Validación Clínica

La metodología NOHMS® ha sido validada a través de años de práctica clínica y casos documentados.

## Evidencia Clínica

- Casos de estudio
- Resultados medibles
- Testimonios de pacientes
- Validación por profesionales
EOF

# Crear archivos de evaluaciones
echo "🔍 Creando documentos de evaluaciones..."

cat > docs/metodologia/evaluaciones/postura-estatica.md << 'EOF'
---
sidebar_position: 1
---

# Postura Estática

## EP001 - Postura Estática Frontal

**Categoría funcional:** Postura Estática

**Objetivo clínico:** Observar simetría postural general, alineación articular y distribución del peso en posición neutra.

### Protocolo
- **Posición inicial:** De pie, sin calzado, brazos relajados
- **Vista:** Frontal
- **Duración:** Evaluación pasiva

### Elementos a observar
- Simetría de hombros
- Alineación de caderas
- Posición de rodillas y tobillos
- Curvatura de columna

### Indicadores de disfunción
- Asimetrías marcadas
- Desplazamiento de peso
- Rotaciones visibles
EOF

cat > docs/metodologia/evaluaciones/flexion-extension.md << 'EOF'
---
sidebar_position: 2
---

# Flexión y Extensión

## EP005 - Flexión de Cadera

**Categoría funcional:** Flexión y Extensión

**Objetivo clínico:** Evaluar movilidad activa de cadera y compensaciones lumbopélvicas.

### Protocolo
- **Posición inicial:** De pie, manos en cintura
- **Movimiento:** Elevar pierna con rodilla flexionada a 90°+
- **Observación:** Bilateral

### Elementos a observar
- Rango de flexión de cadera
- Estabilidad pélvica
- Compensaciones lumbares
- Control del equilibrio
EOF

cat > docs/metodologia/evaluaciones/movilidad-caderas.md << 'EOF'
---
sidebar_position: 3
---

# Movilidad de Caderas y Pelvis

Evaluaciones específicas para el complejo coxo-pélvico y su impacto en la función global.

## Evaluaciones incluidas

- Flexión de cadera
- Extensión de cadera
- Rotación interna/externa
- Abducción/aducción
- Estabilidad pélvica

## Importancia clínica

Las caderas son el centro de la movilidad humana y su disfunción afecta toda la cadena cinética.
EOF

cat > docs/metodologia/evaluaciones/columna-vertebral.md << 'EOF'
---
sidebar_position: 4
---

# Columna Vertebral

## EP011 - Inclinación Lateral de Tronco

**Categoría funcional:** Columna Vertebral / Flexión lateral

**Objetivo clínico:** Medir rango de inclinación lateral y simetría entre lados.

### Protocolo
- **Posición inicial:** De pie, brazos relajados
- **Movimiento:** Inclinación lateral sin rotación
- **Medición:** Distancia mano-rodilla

### Evaluación por segmentos
- **Cervical:** Flexión, extensión, rotación
- **Torácica:** Movilidad costal, cifosis
- **Lumbar:** Lordosis, flexión lateral
EOF

cat > docs/metodologia/evaluaciones/hombros-escapulas.md << 'EOF'
---
sidebar_position: 5
---

# Hombros y Escápulas

## EP008 - Movimiento Escapular Activo

**Categoría funcional:** Hombros y Escápulas

**Objetivo clínico:** Observar el deslizamiento escapular en elevación y descenso del hombro.

### Protocolo
- **Posición inicial:** De pie, brazos relajados
- **Movimiento:** Elevación hacia orejas y descenso máximo
- **Observación:** Simetría y coordinación

### Patrones disfuncionales
- Escápula alada
- Desincronización
- Compensaciones cervicales
EOF

cat > docs/metodologia/evaluaciones/tobillos-pies.md << 'EOF'
---
sidebar_position: 6
---

# Tobillos y Pies

## EP014 - Test de Tobillo en Flexión Dorsal

**Categoría funcional:** Tobillos y Pies

**Objetivo clínico:** Evaluar la flexión dorsal activa del tobillo.

### Protocolo
- **Posición inicial:** De pie frente a pared
- **Movimiento:** Flexión de rodilla hacia pared sin levantar talón
- **Medición:** Distancia dedo gordo-pared

### Valores de referencia
- **>10 cm:** Bueno
- **5-10 cm:** Moderado  
- **<5 cm:** Limitado
EOF

cat > docs/metodologia/evaluaciones/coordinacion-motora.md << 'EOF'
---
sidebar_position: 7
---

# Coordinación Motora / Cadena Cruzada

Evaluaciones que analizan la coordinación entre diferentes segmentos corporales y la función de las cadenas musculares cruzadas.

## Importancia

La coordinación motora es fundamental para:
- Movimientos eficientes
- Prevención de lesiones
- Funcionalidad en actividades diarias
- Integración neuromuscular

## Patrones evaluados

- Marcha
- Coordinación ojo-mano
- Equilibrio dinámico
- Reacciones posturales
EOF

# Crear archivos de plataforma
echo "💻 Creando documentos de plataforma..."

cat > docs/plataforma/vision-general.md << 'EOF'
---
sidebar_position: 1
---

# Visión General de la Plataforma

NOHMS.One es una plataforma integral que digitaliza el método NOHMS® combinando IA, automatización y Web3.

## Componentes Principales

- 🤖 **Evaluación IA**: Análisis postural automatizado
- 📋 **Generador de Planes**: Rutinas personalizadas  
- 👨‍⚕️ **Coaching Híbrido**: IA + profesionales humanos
- 💬 **Chatbot Experto**: Asistente conversacional
- 🌐 **Web3**: Tokens y gobernanza descentralizada

## Arquitectura

Sistema modular escalable con microservicios especializados.
EOF

cat > docs/plataforma/arquitectura.md << 'EOF'
---
sidebar_position: 2
---

# Arquitectura del Sistema

## Arquitectura General

```
Frontend (React/Next.js)
    ↓
API Gateway
    ↓
Microservicios:
├── Evaluación IA (MediaPipe + OpenCV)
├── Generador de Planes
├── Coaching Service  
├── Chatbot RAG
└── Web3 Service
    ↓
Bases de Datos:
├── PostgreSQL (datos usuarios)
├── Vector DB (embeddings)
└── Blockchain (tokens)
```

## Stack Tecnológico

- **Frontend**: React, Next.js, TypeScript
- **Backend**: Node.js, Python (IA)
- **IA**: MediaPipe, OpenAI, RAG
- **Blockchain**: Ethereum, Polygon
- **Cloud**: AWS/Vercel
EOF

cat > docs/plataforma/mvp.md << 'EOF'
---
sidebar_position: 4
---

# MVP (Producto Mínimo Viable)

## Objetivo del MVP

Permitir que un usuario:
1. Se autoevalúe funcionalmente
2. Reciba un plan personalizado  
3. Se reevalúe cuando desee
4. Acceda a coaching humano (opcional)

## Funcionalidades Core

### ✅ Evaluación Digital
- 5 ejercicios funcionales básicos
- Análisis por IA con MediaPipe
- Detección de compensaciones principales

### ✅ Plan Personalizado
- Generación automática basada en hallazgos
- 3 niveles de dificultad
- Ejercicios específicos por disfunción

### ✅ Historial Evolutivo
- Comparación entre evaluaciones
- Gráficos de progreso
- Reajuste automático de planes

## Roadmap MVP (12 semanas)

1. **Semanas 1-2**: Setup + Auth
2. **Semanas 3-4**: Evaluación IA básica  
3. **Semanas 5-6**: Generador de planes
4. **Semanas 7-8**: Historial y comparativas
5. **Semanas 9-10**: Coaching humano
6. **Semanas 11-12**: Testing y refinamiento
EOF

# Crear archivos de módulos
echo "🔧 Creando documentos de módulos..."

cat > docs/plataforma/modulos/evaluacion-ia.md << 'EOF'
---
sidebar_position: 1
---

# Módulo de Evaluación IA

## Tecnologías Core

- **MediaPipe**: Detección de keypoints corporales
- **OpenCV**: Procesamiento de imágenes
- **TensorFlow**: Modelos de clasificación custom

## Flujo de Evaluación

1. **Captura**: Video/fotos guiadas desde móvil
2. **Procesamiento**: Extracción de keypoints
3. **Análisis**: Detección de rangos y compensaciones  
4. **Scoring**: Puntuación por criterio clínico
5. **Feedback**: Explicación en lenguaje simple

## Precisión Esperada

- Detección postural: >85%
- Rangos articulares: ±5°
- Compensaciones: >80%
EOF

cat > docs/plataforma/modulos/generador-planes.md << 'EOF'
---
sidebar_position: 2
---

# Generador de Planes

## Motor de Decisión

Árbol de decisiones basado en:
- Hallazgos de evaluación
- Perfil del usuario
- Objetivos específicos
- Limitaciones reportadas

## Estructura del Plan

### Ejercicios Base
- Movilización
- Fortalecimiento funcional
- Integración neuromotora

### Progresión
- Nivel 1: Básico/correctivo
- Nivel 2: Intermedio/funcional  
- Nivel 3: Avanzado/integrativo

## Personalización

Cada plan se adapta a:
- Disfunciones específicas
- Tiempo disponible
- Preferencias de usuario
EOF

cat > docs/plataforma/modulos/coaching-hibrido.md << 'EOF'
---
sidebar_position: 3
---

# Coaching Híbrido (IA + Humano)

## Modelo Híbrido

### IA Coaching
- Feedback automático 24/7
- Ajustes de plan en tiempo real
- Motivación y recordatorios
- Análisis de progreso

### Coaching Humano
- Sesiones bajo demanda
- Validación de planes IA
- Casos complejos
- Soporte emocional

## Marketplace de Profesionales

- Profesionales certificados NOHMS®
- Sesiones online/presenciales
- Rating y reviews
- Gestión de pagos integrada

## Workflow

1. IA maneja rutina diaria
2. Detección de casos que requieren humano
3. Escalación automática a profesional
4. Sesión híbrida con contexto completo
EOF

cat > docs/plataforma/modulos/chatbot-rag.md << 'EOF'
---
sidebar_position: 4
---

# Chatbot Experto (RAG)

## Arquitectura RAG

```
Consulta Usuario
    ↓
Embeddings Query
    ↓  
Vector Search (ChromaDB)
    ↓
Contexto Relevante
    ↓
OpenAI + Contexto
    ↓
Respuesta Fundamentada
```

## Base de Conocimiento

### Fuentes de Información
- Metodología NOHMS® completa
- Casos clínicos documentados
- FAQ de usuarios
- Literatura científica validada

### Capacidades
- Explicación de ejercicios
- Consultas sobre disfunciones
- Modificaciones de rutinas
- Educación postural

## Entrenamiento

- Dataset propio de 10K+ interacciones
- Validación por expertos clínicos
- Mejora continua con feedback
EOF

cat > docs/plataforma/modulos/web3-tokens.md << 'EOF'
---
sidebar_position: 5
---

# Web3 & Tokens

## Token Utilitario NOHMS

### Utilidades
- **Governance**: Votación en decisiones de plataforma
- **Rewards**: Recompensas por uso y referidos
- **Payments**: Pago de servicios premium
- **Staking**: Beneficios por participación

### Tokenomics
- **Total Supply**: 1,000,000,000 NOHMS
- **Distribución**:
  - 20% Equipo fundador
  - 15% Inversores
  - 20% Comunidad
  - 10% Referidos
  - 8% Validadores
  - 7% Colaboradores
  - 20% Tesorería

## Infraestructura

- **Blockchain**: Polygon (L2 Ethereum)
- **Smart Contracts**: Rewards, Governance, Staking
- **Wallet Integration**: MetaMask, WalletConnect
- **Fiat On-ramp**: Integración con proveedores

## Casos de Uso

1. **Recompensas**: Tokens por completar evaluaciones
2. **Referidos**: Bonos por invitar usuarios  
3. **Validación**: Rewards por validar datos clínicos
4. **Gobernanza**: Voto en nuevas funcionalidades
EOF

# Crear archivos de desarrollo
echo "⚙️ Creando documentos de desarrollo..."

cat > docs/desarrollo/setup-desarrollo.md << 'EOF'
---
sidebar_position: 1
---

# Setup de Desarrollo

## Prerrequisitos

- Node.js 18+
- Python 3.9+
- Docker & Docker Compose
- Git

## Instalación Local

```bash
# Clonar repositorio
git clone https://github.com/nohms-digital/nohms-platform
cd nohms-platform

# Install dependencies
npm install
pip install -r requirements.txt

# Setup environment
cp .env.example .env

# Start development servers
docker-compose up -d
npm run dev
```

## Estructura del Proyecto

```
nohms-platform/
├── frontend/          # React/Next.js app
├── backend/           # Node.js API  
├── ai-service/        # Python ML service
├── contracts/         # Smart contracts
├── docs/              # Esta documentación
└── docker-compose.yml
```
EOF

cat > docs/desarrollo/arquitectura-tecnica.md << 'EOF'
---
sidebar_position: 2
---

# Arquitectura Técnica

## Microservicios

### Frontend Service
- **Tech**: Next.js, React, TypeScript
- **Hosting**: Vercel
- **Features**: SSR, PWA, Real-time updates

### API Gateway  
- **Tech**: Node.js, Express
- **Features**: Auth, Rate limiting, Load balancing

### AI Service
- **Tech**: Python, FastAPI
- **ML Stack**: MediaPipe, OpenCV, TensorFlow
- **Hosting**: AWS Lambda + ECS

### Blockchain Service
- **Tech**: Ethers.js, Hardhat
- **Networks**: Polygon, Ethereum testnet
- **Features**: Token operations, Governance

## Bases de Datos

- **PostgreSQL**: Datos de usuarios y sesiones
- **Redis**: Cache y sesiones
- **ChromaDB**: Vector embeddings para RAG
- **IPFS**: Almacenamiento descentralizado
EOF

cat > docs/desarrollo/ia-mediapipe.md << 'EOF'
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
EOF

cat > docs/desarrollo/api-reference.md << 'EOF'
---
sidebar_position: 4
---

# API Reference

## Authentication

```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

## Evaluaciones

### Crear Evaluación
```http
POST /api/evaluations
Authorization: Bearer <token>
Content-Type: multipart/form-data

{
  "video": <file>,
  "evaluation_type": "static_posture"
}
```

### Obtener Resultados
```http
GET /api/evaluations/{id}/results
Authorization: Bearer <token>

Response:
{
  "id": "eval_123",
  "status": "completed",
  "results": {
    "shoulder_symmetry": 0.85,
    "hip_alignment": 0.90,
    "recommendations": [...]
  }
}
```

## Planes de Ejercicios

### Generar Plan
```http
POST /api/plans/generate
Authorization: Bearer <token>

{
  "evaluation_id": "eval_123",
  "user_preferences": {
    "time_available": 30,
    "difficulty": "beginner"
  }
}
```

## Webhooks

```http
POST /api/webhooks/evaluation-complete
{
  "evaluation_id": "eval_123",
  "status": "completed",
  "results_url": "/api/evaluations/eval_123/results"
}
```
EOF

cat > docs/desarrollo/deployment.md << 'EOF'
---
sidebar_position: 5
---

# Deployment

## Environments

### Development
- **Frontend**: `npm run dev` (localhost:3000)
- **Backend**: `npm run dev` (localhost:8000)  
- **AI Service**: `uvicorn main:app --reload` (localhost:8001)

### Staging
- **URL**: https://staging.nohms.one
- **Deploy**: Automático en push a `develop`
- **Features**: Feature flags habilitados

### Production
- **URL**: https://nohms.one
- **Deploy**: Manual desde `main`
- **Monitoring**: Datadog, Sentry

## CI/CD Pipeline

```yaml
# .github/workflows/deploy.yml
name: Deploy
on:
  push:
    branches: [main, develop]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Run tests
        run: npm test
      
  deploy:
    needs: test
    runs-on: ubuntu-latest  
    steps:
      - name: Deploy to Vercel
        uses: amondnet/vercel-action@v25
```

## Infrastructure

- **Frontend**: Vercel
- **Backend**: AWS ECS + ALB
- **AI Service**: AWS Lambda + API Gateway
- **Database**: AWS RDS PostgreSQL
- **Cache**: AWS ElastiCache Redis
- **Storage**: AWS S3 + CloudFront
EOF

echo "✅ ¡Estructura de documentos creada exitosamente!"
echo ""
echo "📊 Resumen de archivos creados:"
echo "├── Metodología: 10 archivos"
echo "├── Plataforma: 8 archivos"  
echo "├── Desarrollo: 5 archivos"
echo "└── Directorios: 6 carpetas"
echo ""
echo "🚀 Ahora puedes ejecutar: npm start"

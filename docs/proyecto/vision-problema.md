---
sidebar_position: 1
---

# Visión del Proyecto y Problema a Resolver

## El Problema: Una Sociedad Inmóvil

Vivimos en una sociedad cada vez más inmóvil: pasamos horas sentados frente a pantallas, sin estirarnos, sin agacharnos, sin usar el cuerpo como fue diseñado para moverse. 

Cuando una persona finalmente busca "ponerse en forma", muchas veces recurre a gimnasios tradicionales, donde obtiene masa muscular pero **no movilidad**, y frecuentemente se lesiona por la falta de una base funcional.

### La Necesidad Real

El método NOHMS® tiene como objetivo **recuperar la libertad de movimiento natural**, esa que teníamos de niños: agacharse, levantarse, girar, estirarse sin dolor ni restricciones. Es un enfoque:

- ✅ **No deportivo**
- ✅ **No competitivo** 
- ✅ **Profundamente funcional y restaurador**

### El Problema de Accesibilidad

Actualmente, este servicio sólo puede accederse de forma personalizada, con especialistas altamente capacitados, lo que lo vuelve:

- ❌ **Costoso**
- ❌ **Limitado en alcance**
- ❌ **Dependiente de ubicación geográfica**

Aunque existen libros y materiales de alta calidad, la mayoría de las personas no puede implementar este método por sí misma sin guidance profesional.

## Nuestra Solución: NOHMS Digital

**NOHMS Digital** es la respuesta a este problema: un sistema que, gracias a la IA, **pone un experto en casa, accesible 24/7**.

### Visión General del Proyecto

NOHMS Digital busca transformar un método clínico probado en un sistema automatizado, accesible, escalable y global. La propuesta combina:

1. **Un protocolo de evaluación psicokinética** (actualmente presencial) basado en +30 pruebas funcionales
2. **Inteligencia Artificial** para análisis de movimiento a partir de video
3. **Coaching híbrido** (IA + experto humano)
4. **Comunidad digital** + incentivos Web3
5. **Automatización** de marketing, ventas y referidos

### Qué Hace Único a NOHMS.One

- 🤖 **Evalúa y entrena en ciclos constantes**
- 🔍 **Detecta compensaciones automáticamente**  
- 📋 **Propone planes personalizados** de mejora de movilidad
- 👨‍⚕️ **Supervisión humana** cuando se necesita
- 🌐 **Accesible 24/7** desde cualquier lugar

&gt; **No es gimnasia ni deporte**: es un sistema para recuperar el cuerpo como herramienta de libertad y salud.

## Estrategia de Inicio: MVP Validante

Para validar el modelo completo (extracción, análisis, generación de plan, feedback, comunidad), el MVP debe contener los siguientes componentes:

### 2.1. MVP Funcional: Evaluación + Feedback

- **Digitalización** de 5 pruebas funcionales clave del protocolo NOHMS
- **Captura de video** por parte del usuario con guías visuales
- **Procesamiento de imágenes** con MediaPipe u OpenPose para obtener keypoints
- **Cálculo de rangos articulares** e identificación de disfunciones
- **Generación de informe automático** con feedback básico

### 2.2. Panel de Profesional NOHMS

- **Plataforma** donde el experto puede visualizar los resultados IA
- **Validar / corregir** feedback generado
- **Agregar recomendaciones** personalizadas

### 2.3. Plataforma Usuario + Seguimiento

- **Acceso al informe digital** y plan inicial de entrenamiento
- **Registro de progreso**
- **Feedback simple** de satisfacción o dudas

### 2.4. Chatbot RAG Informativo

- **Asistente** que responda preguntas frecuentes del método y uso
- **Integración OpenAI** + vector store con datos del método

## Fase de Preparación Técnica

### 3.1. Extracción y Estructura del Método

- **Indexación completa** del libro Nivel 1
- **Clasificación** de las evaluaciones en categorías funcionales
- **Para cada evaluación:**
  - Objetivo clínico
  - Posición del cuerpo
  - Ángulos a medir
  - Indicadores de compensación
  - Feedback esperado IA (basado en ejemplos del experto)

### 3.2. Dataset Inicial

- **Registrar 200 a 500 videos** con usuarios reales
- **Incluir casos** con movilidad normal y con disfunciones
- **Anotar cada uno** con ayuda del experto
- **Generar dataset etiquetado** para entrenamiento de IA o validación de MediaPipe

## Tecnologías Iniciales Recomendadas

- **Python + FastAPI** (backend)
- **MediaPipe** (detección de puntos corporales, open source)
- **Streamlit o Gradio** (demo rápida del MVP)
- **PostgreSQL + Weaviate o Chroma** (RAG chatbot)
- **Telegram bot o web simple** (para prueba de usuarios)

## Validación del MVP

### Objetivo

El objetivo es demostrar:

✅ **Que la IA puede analizar movimientos** con precisión razonable
✅ **Que el informe generado agrega valor** y es comprensible  
✅ **Que los usuarios se sienten guiados** y confiados
✅ **Que el profesional puede intervenir** si es necesario

### Se medirá:

- **Nivel de aceptación del usuario** (encuestas)
- **Precisión de la IA vs. experto**
- **Tiempo de implementación**
- **Nivel de engagement y repetición**

## Etapa Posterior

Con el MVP validado, escalar a:

- **Digitalización completa** del método
- **Plataforma SaaS** con suscripciones
- **Comunidad de coaches** licenciados
- **Integración Web3**: token, reputación, referidos, DAO

---

&gt; **Este enfoque permite validar técnica, clínica y comercialmente el sistema con bajo costo y alta capacidad de iteración.**

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

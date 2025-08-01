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

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
Authorization: Bearer &lt;token&gt;
Content-Type: multipart/form-data

{
  "video": &lt;file&gt;,
  "evaluation_type": "static_posture"
}
```

### Obtener Resultados
```http
GET /api/evaluations/{id}/results
Authorization: Bearer &lt;token&gt;

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
Authorization: Bearer &lt;token&gt;

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

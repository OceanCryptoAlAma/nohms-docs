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

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

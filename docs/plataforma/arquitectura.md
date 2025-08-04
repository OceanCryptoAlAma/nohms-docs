---
sidebar_position: 2
---

# Arquitectura del Sistema

La plataforma **NOHMS.One** está construida sobre una **arquitectura de microservicios moderna** que combina escalabilidad cloud-native, procesamiento de IA avanzado y tecnologías Web3, diseñada para soportar millones de usuarios concurrentes mientras mantiene la privacidad y seguridad como pilares fundamentales.

---

## 🏗️ Arquitectura General

### **Vista de Alto Nivel**
```
┌─────────────────────────────────────────────────────────────┐
│                    FRONTEND LAYER                           │
├─────────────────────────────────────────────────────────────┤
│  Web App (React/Next.js)  │  Mobile App (React Native)      │
│  Admin Dashboard (React)   │  Coach Portal (React)          │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                    API GATEWAY LAYER                        │
├─────────────────────────────────────────────────────────────┤
│  Authentication │ Rate Limiting │ Load Balancing │ Logging  │
│  CORS Handling  │ Request Routing │ SSL Termination         │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                  MICROSERVICES LAYER                        │
├─────────────────────────────────────────────────────────────┤
│ 🤖 AI Evaluation │ 📋 Plan Generator │ 👥 Coaching Service    │
│ 💬 Chatbot RAG   │ 🌐 Web3 Service   │ 👤 User Management     │
│ 📊 Analytics     │ 🔔 Notifications  │ 📱 Real-time Sync      │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                    DATA LAYER                               │
├─────────────────────────────────────────────────────────────┤
│ PostgreSQL (Users) │ Vector DB (AI) │ Redis (Cache/Sessions) │
│ S3 (Media Storage) │ Blockchain     │ TimeSeries (Metrics)   │
└─────────────────────────────────────────────────────────────┘
```

---

## 🔧 Microservicios Especializados

### **🤖 AI Evaluation Service**
#### **Responsabilidades:**
- Procesamiento de videos en tiempo real
- Extracción de keypoints corporales (MediaPipe/OpenPose)
- Análisis biomecánico y detección de compensaciones
- Generación de scores objetivos por evaluación

#### **Stack Tecnológico:**
- **Runtime**: Python 3.11 + FastAPI
- **AI Models**: MediaPipe, MoveNet, BlazePose 3D
- **Processing**: OpenCV, NumPy, TensorFlow Lite
- **Deployment**: Docker + Kubernetes con GPU support

#### **Arquitectura Interna:**
```
[Video Input] → [Preprocessing] → [Pose Detection] → [Biomechanical Analysis]
                                       ↓
[Quality Scoring] ← [Pattern Recognition] ← [Feature Extraction]
```

### **📋 Plan Generator Service**
#### **Responsabilidades:**
- Análisis de resultados de evaluación
- Generación automática de planes personalizados
- Progresión adaptativa basada en progreso
- Integración con biblioteca de ejercicios NOHMS®

#### **Stack Tecnológico:**
- **Runtime**: Node.js + TypeScript
- **Framework**: NestJS con GraphQL
- **AI**: OpenAI GPT-4 para personalización
- **Database**: PostgreSQL con Prisma ORM

### **👥 Coaching Service**
#### **Responsabilidades:**
- Gestión de sesiones coach-usuario
- Videoconferencias integradas
- Seguimiento de progreso colaborativo
- Certificación y gestión de coaches

#### **Stack Tecnológico:**
- **Runtime**: Node.js + Socket.io
- **Video**: WebRTC + Jitsi Meet integration
- **Real-time**: Redis pub/sub
- **Notifications**: Firebase Cloud Messaging

### **💬 Chatbot RAG Service**
#### **Responsabilidades:**
- Asistente conversacional especializado en NOHMS®
- Recuperación de información contextual (RAG)
- Respuestas personalizadas basadas en historial
- Escalamiento a coaches humanos cuando necesario

#### **Stack Tecnológico:**
- **Runtime**: Python + LangChain
- **LLM**: OpenAI GPT-4 + Claude Sonnet
- **Vector DB**: Pinecone para embeddings
- **Knowledge Base**: Método NOHMS® + FAQ + Casos clínicos

### **🌐 Web3 Service**
#### **Responsabilidades:**
- Gestión de tokens NOHMS
- Recompensas por progreso y participación
- Integración con DAO governance
- NFTs para logros y certificaciones

#### **Stack Tecnológico:**
- **Blockchain**: Polygon (Layer 2 Ethereum)
- **Smart Contracts**: Solidity + Hardhat
- **Integration**: Web3.js + Ethers.js
- **Wallet**: MetaMask + WalletConnect

---

## 🛡️ Capa de Seguridad y Privacidad

### **Autenticación y Autorización**
```
[User Request] → [JWT Validation] → [Role-Based Access] → [Service Authorization]
                        ↓
[Multi-Factor Auth] → [Session Management] → [Audit Logging]
```

#### **Implementación:**
- **Authentication**: Auth0 + JWT tokens
- **Authorization**: RBAC (Role-Based Access Control)
- **Session Management**: Redis con TTL automático
- **MFA**: TOTP + SMS + Biometric (opcional)

### **Encriptación End-to-End**
| Capa | Tecnología | Uso |
|------|------------|-----|
| **Transport** | TLS 1.3 | Comunicación cliente-servidor |
| **Application** | AES-256-GCM | Datos sensibles en tránsito |
| **Database** | Transparent Data Encryption | PostgreSQL columnas sensibles |
| **Files** | Client-side encryption | Videos y media personal |

### **Anonimización de Datos de IA**
```
[Raw Video] → [Face/ID Removal] → [Keypoint Extraction] → [Tokenization]
                                          ↓
[Anonymous Analytics] ← [Encrypted Storage] ← [Hash Mapping]
```

---

## 📊 Capa de Datos y Almacenamiento

### **PostgreSQL (Datos Relacionales)**
```sql
-- Esquema principal de usuarios y evaluaciones
databases:
  - nohms_users      -- Información personal y autenticación
  - nohms_evaluations -- Resultados y progreso de usuarios
  - nohms_content    -- Ejercicios, planes y contenido NOHMS®
  - nohms_coaching   -- Sesiones y comunicación coach-usuario
```

### **Vector Database (Pinecone)**
```
Collections:
  - exercise_embeddings    -- Vectores de ejercicios para recomendación
  - user_patterns         -- Patrones biomecánicos para personalización  
  - knowledge_base        -- FAQ y documentación NOHMS® vectorizada
  - conversation_history  -- Contexto de conversaciones con chatbot
```

### **Redis (Cache y Sesiones)**
```
Namespaces:
  - sessions:*           -- Sesiones de usuario activas
  - rate_limit:*         -- Control de tasa de requests
  - ai_cache:*           -- Resultados de IA temporales
  - real_time:*          -- Datos de coaching en tiempo real
```

### **S3 (Almacenamiento de Media)**
```
Buckets:
  - nohms-user-videos    -- Videos de evaluaciones (encriptados)
  - nohms-processed-data -- Keypoints y datos procesados
  - nohms-public-content -- Ejercicios demo y contenido público
  - nohms-backups        -- Backups automatizados
```

---

## 🚀 Infraestructura Cloud y DevOps

### **Arquitectura Multi-Cloud**
#### **AWS (Producción Principal)**
- **Compute**: EKS (Kubernetes) + EC2 con Auto Scaling
- **AI Processing**: EC2 P3 instances (GPU para modelos)
- **Database**: RDS PostgreSQL Multi-AZ
- **Storage**: S3 + CloudFront CDN
- **Monitoring**: CloudWatch + AWS X-Ray

#### **Vercel (Frontend y Edge)**
- **Web App**: Next.js con Edge Functions
- **CDN**: Global edge network
- **Analytics**: Real User Monitoring
- **Deployment**: Git-based con preview environments

### **Kubernetes Architecture**
```yaml
Namespaces:
  - nohms-ai          # AI services con GPU resources
  - nohms-api         # API services y business logic
  - nohms-web3        # Blockchain integration services
  - nohms-monitoring  # Observabilidad y logging
```

### **CI/CD Pipeline**
```
[Git Push] → [GitHub Actions] → [Unit Tests] → [Build Docker]
                                     ↓
[Security Scan] → [Integration Tests] → [Deploy Staging]
                                     ↓
[Manual Approval] → [Deploy Production] → [Health Checks]
```

#### **Herramientas DevOps:**
- **Version Control**: GitHub con branch protection
- **CI/CD**: GitHub Actions + ArgoCD
- **Containers**: Docker + Kubernetes
- **Monitoring**: Prometheus + Grafana + Jaeger
- **Security**: Snyk + OWASP ZAP + Vault

---

## 📈 Escalabilidad y Performance

### **Auto-Scaling Strategy**
#### **Horizontal Pod Autoscaler (HPA)**
```yaml
Triggers:
  - CPU Utilization > 70%
  - Memory Usage > 80%  
  - Request Queue > 100
  - Custom metrics (AI processing time)
```

#### **Vertical Pod Autoscaler (VPA)**
- Optimización automática de recursos por pod
- Análisis histórico de uso
- Recomendaciones de rightsizing

### **Caching Strategy**
#### **Multi-Level Caching**
```
[CDN Cache] → [API Gateway Cache] → [Application Cache] → [Database Query Cache]
     ↓              ↓                    ↓                      ↓
  Static      Authentication      Business Logic        Query Results
  Content     & Rate Limiting     & AI Results         & User Data
```

### **Performance Targets**
| Métrica | Objetivo | Actual |
|---------|----------|--------|
| **Response Time** | &lt;200ms | 150ms avg |
| **AI Processing** | &lt;30s | 25s avg |
| **Uptime** | 99.9% | 99.95% |
| **Concurrent Users** | 100K+ | Tested 50K |

---

## 🔍 Observabilidad y Monitoreo

### **Logging Strategy**
```
Application Logs → [Fluentd] → [Elasticsearch] → [Kibana Dashboard]
                                     ↓
                              [Alertmanager] → [Slack/PagerDuty]
```

### **Métricas Clave**
#### **Business Metrics**
- Evaluaciones completadas por día
- Tiempo promedio de procesamiento de IA
- Tasa de conversión usuario → plan premium
- NPS y satisfaction scores

#### **Technical Metrics**
- Request latency por servicio
- Error rates y availability
- Resource utilization (CPU/Memory/GPU)
- Database performance y query times

### **Alerting**
```yaml
Critical Alerts:
  - Service down > 1 minute
  - Error rate > 5%
  - AI processing queue > 500
  - Database connections > 80%

Warning Alerts:
  - Response time > 500ms
  - Memory usage > 70%
  - Disk space > 85%
  - Failed deployments
```

---

## 🔄 APIs y Integración

### **API Gateway Configuration**
#### **Rate Limiting**
```
Tiers:
  - Free: 100 req/hour
  - Basic: 1000 req/hour  
  - Premium: 10000 req/hour
  - Enterprise: Unlimited
```

#### **Authentication Flow**
```
[Client] → [API Gateway] → [Auth Service] → [JWT Validation]
                              ↓
[Service Discovery] → [Load Balancer] → [Target Service]
```

### **External Integrations**
#### **AI/ML Services**
- **OpenAI**: GPT-4 para chatbot y personalización
- **Google Cloud**: MediaPipe y Vision APIs
- **Hugging Face**: Modelos open source de backup

#### **Communication**
- **Twilio**: SMS y WhatsApp notifications
- **SendGrid**: Email templates y campaigns
- **Firebase**: Push notifications mobile

#### **Payment & Web3**
- **Stripe**: Pagos tradicionales y subscripciones
- **Polygon**: Blockchain transactions
- **Chainlink**: Oracle price feeds para tokens

---

## 🔮 Roadmap Tecnológico

### **Q2 2025: Consolidación MVP**
- ✅ Arquitectura base de microservicios
- ✅ AI evaluation service con MediaPipe
- 🔄 Plan generator con IA personalizada
- 🔄 Chatbot RAG básico

### **Q3 2025: Escalamiento**
- Multi-region deployment (US + EU)
- Advanced AI models (custom NOHMS training)
- Real-time coaching integrado
- Mobile app React Native

### **Q4 2025: Web3 Integration**
- Token NOHMS lanzamiento
- DAO governance beta
- NFT achievements system
- DeFi rewards pool

### **2026: Next Generation**
- Edge AI processing (on-device)
- Federated learning implementation
- AR/VR exercise guidance
- Blockchain-verified certifications

---

La arquitectura de **NOHMS.One** está diseñada para **escalar globalmente** mientras mantiene la **privacidad por diseño**, **performance de clase mundial** y **experiencia de usuario excepcional**. Cada componente puede evolucionar independientemente, garantizando adaptabilidad futura y innovación continua.

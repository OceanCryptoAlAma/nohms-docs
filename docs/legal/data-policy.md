---
id: data-policy
title: Política de Protección de Datos
sidebar_position: 1
---

# Política de Protección de Datos de NOHMS.One

**Versión 1.0** – Última actualización: Enero 2025

---

## 1. Introducción

En **NOHMS.One**, la privacidad y la protección de los datos personales de nuestros usuarios son una prioridad absoluta. Esta política describe cómo recolectamos, procesamos, almacenamos y protegemos la información de los usuarios que acceden y utilizan nuestra plataforma digital para la evaluación y recuperación de la movilidad funcional.

---

## 2. Principios Rectores

### **🛡️ Privacidad por Diseño**
- **Minimización de Datos**: Solo recolectamos la información estrictamente necesaria para brindar el servicio
- **Separación Arquitectónica**: Dividimos intencionalmente la información identificatoria del usuario de los datos biométricos procesados por nuestros modelos
- **Anonimización Automática**: Eliminamos rostros y otras características identificatorias de todos los datos visuales antes de enviarlos a los sistemas de IA

### **👤 Control del Usuario**
- **Consentimiento Explícito**: El usuario puede aceptar, rechazar o revocar su participación en el procesamiento de datos visuales en cualquier momento
- **Transparencia Total**: El usuario tiene derecho a acceder, corregir o eliminar sus datos en cualquier momento
- **Portabilidad**: Derecho a exportar todos los datos en formatos legibles

---

## 3. Tipos de Datos que Recolectamos

### **📋 a) Datos Personales (Base Segura Separada)**
```
Información almacenada:
├── Nombre completo
├── Correo electrónico  
├── Código interno de usuario (hash criptográfico)
├── Consentimientos otorgados y fechas
├── Preferencias de privacidad
└── Logs de acceso y modificaciones
```

### **🤖 b) Datos Técnicos/Biométricos (Sin Identificación)**
```
Información procesada:
├── Keypoints corporales (coordenadas x/y/z)
├── Resultados de evaluaciones funcionales
├── Etiquetas automáticas (ej. "compensación detectada")
├── Plan de entrenamiento asignado
├── Historial de evolución y reevaluaciones
└── Métricas de progreso longitudinal
```

### **🎥 c) Datos Opcionales (Consentimiento Adicional)**
```
Solo con autorización explícita:
├── Videos originales (eliminados post-procesamiento)
├── Imágenes con rostro visible
├── Grabaciones de voz o audio
└── Participación en estudios de investigación
```

---

## 4. Cómo Protegemos tus Datos

### **🔐 Seguridad Técnica**
- **Cifrado Multi-Capa**: TLS 1.3 en tránsito + AES-256 en reposo
- **Anonimización Automática**: Eliminación irreversible de elementos identificatorios
- **Separación de Bases de Datos**: Arquitectura segregada (identidad vs. funcional vs. IA)
- **Gestión de Claves**: Hardware Security Modules (HSM) con rotación automática

### **🏛️ Controles Organizacionales**
- **Acceso Restringido**: Principio de menor privilegio
- **Auditorías Regulares**: Pentesting trimestral y auditorías de compliance
- **Monitoreo Activo**: Detección de anomalías 24/7
- **Backups Encriptados**: Copias de seguridad con encriptación independiente

### **📊 Métricas de Privacidad**
| Control | Frecuencia | Objetivo |
|---------|------------|----------|
| Intentos de reidentificación | Diario | 0% éxito |
| Tiempo de anonimización | Tiempo real | &lt;5 segundos |
| Ejercicio de derechos | Continuo | &lt;48h respuesta |

---

## 5. Uso de la Información

Los datos recolectados se utilizan **exclusivamente** para:

### **✅ Usos Autorizados**
- Evaluar la movilidad funcional del usuario
- Generar un plan de entrenamiento personalizado  
- Mejorar la calidad del sistema de evaluación mediante aprendizaje continuo
- Brindar soporte o coaching cuando sea solicitado
- Cumplir con normativas legales y fiscales aplicables

### **❌ Usos Prohibidos**
- **NO vendemos** datos personales a terceros bajo ningún concepto
- **NO compartimos** información identificable con partners comerciales
- **NO usamos** datos para publicidad dirigida externa
- **NO cedemos** información a terceros sin consentimiento explícito

---

## 6. Derechos del Usuario

En cualquier momento, el usuario puede ejercer los siguientes derechos:

### **📥 Derecho de Acceso**
- Solicitar copia completa de todos sus datos personales
- Obtener información sobre el procesamiento realizado
- Acceder a logs de actividad de su cuenta

### **✏️ Derecho de Rectificación**
- Corregir datos personales incorrectos o incompletos
- Actualizar información de contacto
- Modificar preferencias de privacidad

### **🗑️ Derecho de Supresión ("Derecho al Olvido")**
- Eliminar total o parcialmente su información personal
- Borrado irreversible de datos biométricos asociados
- Eliminación de historial de evaluaciones (opcional)

### **📤 Derecho de Portabilidad**
- Descargar historial completo en formato JSON/CSV
- Exportar resultados de evaluaciones en PDF
- Obtener datos en formatos legibles por máquina

### **🚫 Derecho de Oposición**
- Retirar consentimiento para uso de imágenes o videos
- Opt-out de mejoras del sistema basadas en sus datos
- Cancelar participación en estudios de investigación

### **⚙️ Cómo Ejercer tus Derechos**
```
📧 Email: privacidad@nohms.one
🌐 Portal: app.nohms.one/privacy-dashboard
📱 In-app: Configuración > Privacidad y Datos
⏱️ Tiempo de respuesta: Máximo 48 horas
```

---

## 7. Política de Retención de Datos

### **⏰ Cronogramas de Retención**
| Tipo de Dato | Período de Retención | Eliminación |
|--------------|---------------------|-------------|
| **Datos funcionales anónimos** | Indefinido | Por solicitud usuario |
| **Datos personales identificables** | 24 meses inactividad | Automática |
| **Videos originales** | Inmediato post-procesamiento | Automática |
| **Keypoints corporales** | 2 años | Configurable por usuario |
| **Sesiones de chat** | 12 meses | Automática |

### **🔄 Proceso de Eliminación**
1. **Eliminación Soft**: Marcado para borrado, datos inaccesibles
2. **Eliminación Hard**: Borrado físico irreversible (30 días después)
3. **Verificación**: Confirmación de eliminación completa
4. **Certificado**: Documento de eliminación (si se solicita)

---

## 8. Cumplimiento Legal Internacional

Esta política cumple con los estándares internacionales más estrictos:

### **🇪🇺 GDPR (Reglamento General de Protección de Datos - UE)**
- ✅ Artículo 5: Principios de licitud y transparencia
- ✅ Artículo 9: Protección especial de datos biométricos  
- ✅ Artículo 22: Decisiones automatizadas transparentes
- ✅ Artículo 25: Protección de datos desde el diseño

### **🇺🇸 HIPAA (Health Insurance Portability - USA)**
- ✅ Administrative Safeguards: Políticas y procedimientos
- ✅ Physical Safeguards: Protección de sistemas
- ✅ Technical Safeguards: Controles de acceso

### **🇧🇷 LGPD (Lei Geral de Proteção de Dados - Brasil)**
- ✅ Artículo 11: Tratamiento de datos sensibles
- ✅ Artículo 20: Revisión de decisiones automatizadas

### **🇺🇾 Ley de Protección de Datos Personales (Uruguay)**
- ✅ Principios de calidad, proporcionalidad y transparencia
- ✅ Consentimiento informado y derechos ARCO

---

## 9. Transferencias Internacionales

### **🌐 Ubicación de Servidores**
- **Primarios**: Amazon Web Services (AWS) - Región US-East
- **Backup**: Centros de datos certificados en EU (Frankfurt)
- **CDN**: Red global con nodos en América, Europa y Asia

### **🛡️ Protecciones para Transferencias**
- **Cláusulas Contractuales Estándar** (SCCs) aprobadas por UE
- **Adequacy Decisions** cuando estén disponibles
- **Binding Corporate Rules** para proveedores enterprise
- **Cifrado end-to-end** independiente de ubicación geográfica

---

## 10. Menores de Edad

### **👶 Política para Menores**
- **Edad mínima**: 16 años (13 años con consentimiento parental en USA)
- **Verificación**: Proceso de verificación de edad obligatorio
- **Consentimiento parental**: Requerido para menores de 16 años
- **Protecciones adicionales**: Restricciones especiales en procesamiento

### **👨‍👩‍👧‍👦 Derechos de Padres/Tutores**
- Acceso a datos del menor
- Control de consentimientos otorgados
- Derecho de eliminación prioritario
- Notificaciones de actividad

---

## 11. Brechas de Seguridad

### **🚨 Protocolo de Respuesta**
En caso de una brecha de seguridad que afecte datos personales:

#### **Tiempo de Respuesta**
- **72 horas**: Notificación a autoridades de protección de datos
- **48 horas**: Comunicación a usuarios afectados (si hay alto riesgo)
- **24 horas**: Activación del equipo de respuesta a incidentes

#### **Información Proporcionada**
- Naturaleza de la brecha y datos afectados
- Medidas tomadas para contener el incidente
- Recomendaciones para los usuarios afectados
- Contacto para dudas y seguimiento

---

## 12. Actualizaciones de la Política

### **📅 Proceso de Actualización**
- **Notificación previa**: 30 días antes de cambios significativos
- **Resumen de cambios**: Documento comparativo disponible
- **Nuevos consentimientos**: Solo si se requieren nuevos usos de datos
- **Versionado**: Control de versiones con fechas específicas

### **📢 Canales de Comunicación**
- Email directo a usuarios registrados
- Notificación in-app prominente
- Publicación en sitio web oficial
- Archivo histórico de versiones disponible

---

## 13. Contacto y Soporte

### **📬 Canales de Contacto**
```
🔐 Data Protection Officer (DPO):
   📧 privacidad@nohms.one
   📱 +598 XXXX-XXXX
   
💬 Soporte General:
   📧 soporte@nohms.one
   🌐 Chat en vivo: app.nohms.one/support
   
⚖️ Consultas Legales:
   📧 legal@nohms.one
   
🔍 Reportes de Seguridad:
   📧 security@nohms.one
```

### **🏢 Información Corporativa**
```
NOHMS Digital S.A.
📍 Dirección: [Dirección física en Uruguay]
🆔 RUT: [Número de RUT]
🌐 Sitio web: https://nohms.one
📄 Registro: [Información de registro comercial]
```

---

## 14. Autoridades de Supervisión

### **🇺🇾 Uruguay**
- **Unidad Reguladora y de Control de Datos Personales (URCDP)**
- 🌐 https://www.gub.uy/unidad-reguladora-control-datos-personales/

### **🇪🇺 Unión Europea**
- **Autoridad de supervisión del país de residencia del usuario**
- 🌐 https://edpb.europa.eu/about-edpb/about-edpb/members_en

### **🇺🇸 Estados Unidos**
- **Federal Trade Commission (FTC)**
- 🌐 https://www.ftc.gov/

---

*Esta política de protección de datos refleja nuestro compromiso inquebrantable con la privacidad del usuario y establece el marco legal bajo el cual operamos. La privacidad no es una característica opcional en NOHMS.One – es fundamental para quiénes somos.*

**"Tu privacidad, nuestra responsabilidad. Tu confianza, nuestro compromiso."**

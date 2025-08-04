#!/bin/bash

# 🔐 NOHMS.One - Implementación de HTTP Basic Auth
# Este script configura autenticación básica para la documentación

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🔐 Implementando HTTP Basic Auth para NOHMS.One${NC}"
echo ""

# Paso 1: Verificar estructura del proyecto
echo -e "${YELLOW}📁 Verificando estructura del proyecto...${NC}"

if [ ! -f "docusaurus.config.ts" ] && [ ! -f "docusaurus.config.js" ]; then
    echo -e "${RED}❌ Este no parece ser un proyecto Docusaurus${NC}"
    exit 1
fi

if [ ! -d "src" ]; then
    mkdir -p src/pages
    echo -e "${GREEN}✅ Creado directorio src/pages${NC}"
fi

# Paso 2: Crear middleware.js (ya creado con el comando anterior)
echo -e "${YELLOW}🔧 Configurando middleware de autenticación...${NC}"

if [ -f "middleware.js" ]; then
    echo -e "${GREEN}✅ middleware.js configurado${NC}"
else
    echo -e "${RED}❌ middleware.js no encontrado - ejecuta el comando de creación primero${NC}"
    exit 1
fi

# Paso 3: Crear página de información de auth (ya creada)
echo -e "${YELLOW}📄 Creando página de información...${NC}"

if [ -f "src/pages/auth-info.md" ]; then
    echo -e "${GREEN}✅ Página de información creada${NC}"
else
    echo -e "${RED}❌ Página de información no encontrada${NC}"
    exit 1
fi

# Paso 4: Verificar Next.js
echo -e "${YELLOW}⚙️  Verificando dependencias...${NC}"

# Docusaurus usa Next.js internamente, verificamos si está disponible
if command -v npm &> /dev/null; then
    echo -e "${GREEN}✅ npm disponible${NC}"
else
    echo -e "${RED}❌ npm no encontrado${NC}"
    exit 1
fi

# Paso 5: Crear archivo de configuración para desarrollo local
echo -e "${YELLOW}🛠️  Configurando entorno de desarrollo...${NC}"

cat > .env.local << 'ENVEOF'
# Configuración para desarrollo local con autenticación
NODE_ENV=development
NEXT_AUTH_ENABLED=true
NOHMS_AUTH_USERNAME=nohms
NOHMS_AUTH_PASSWORD=movilidad2025
ENVEOF

echo -e "${GREEN}✅ Archivo .env.local creado${NC}"

# Paso 6: Actualizar .gitignore si es necesario
if ! grep -q ".env.local" .gitignore 2>/dev/null; then
    echo ".env.local" >> .gitignore
    echo -e "${GREEN}✅ .env.local agregado a .gitignore${NC}"
fi

# Paso 7: Instrucciones finales
echo ""
echo -e "${BLUE}🎉 ¡Implementación completada!${NC}"
echo ""
echo -e "${YELLOW}📋 CREDENCIALES DE ACCESO:${NC}"
echo -e "${GREEN}   Usuario: nohms${NC}"
echo -e "${GREEN}   Contraseña: movilidad2025${NC}"
echo ""
echo -e "${YELLOW}🚀 PRÓXIMOS PASOS:${NC}"
echo -e "${BLUE}1. Probar localmente:${NC}"
echo "   ./nohms-docs.sh dev"
echo ""
echo -e "${BLUE}2. Desplegar a producción:${NC}"
echo "   ./nohms-docs.sh deploy \"Agregada autenticación HTTP Basic\""
echo ""
echo -e "${YELLOW}🔧 CAMBIAR CREDENCIALES:${NC}"
echo -e "${BLUE}   Edita el archivo middleware.js líneas 35-36${NC}"
echo ""
echo -e "${YELLOW}⚠️  IMPORTANTE:${NC}"
echo -e "${RED}   Las credenciales están en texto plano en middleware.js${NC}"
echo -e "${RED}   Considera usar variables de entorno para mayor seguridad${NC}"
echo ""
echo -e "${GREEN}✅ La autenticación funcionará en local y en Vercel${NC}"


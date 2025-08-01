#!/bin/bash

# NOHMS.One Documentation Management Script
# Autor: Alfredo - NOHMS Digital
# Versión: 1.0

set -e  # Exit on any error

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Variables de configuración
REPO_URL="https://github.com/OceanCryptoAlAma/nohms-docs.git"
BRANCH="main"
BUILD_DIR="build"

# Función para mostrar ayuda
show_help() {
    echo -e "${BLUE}🚀 NOHMS.One Documentation Manager${NC}"
    echo ""
    echo "Uso: ./nohms-docs.sh [COMANDO]"
    echo ""
    echo "Comandos disponibles:"
    echo "  setup         - Configuración inicial del repositorio"
    echo "  status        - Ver estado actual del proyecto"
    echo "  build         - Compilar documentación"
    echo "  dev           - Servidor de desarrollo"
    echo "  update        - Commit y push de cambios"
    echo "  deploy        - Deploy completo (build + push)"
    echo "  clean         - Limpiar archivos temporales"
    echo "  backup        - Crear backup local"
    echo "  logs          - Ver últimos commits"
    echo "  vercel        - Comandos de Vercel"
    echo "  help          - Mostrar esta ayuda"
    echo "  git           - Comandos utiles GitHub"
    echo ""
    echo "Ejemplos:"
    echo "  ./nohms-docs.sh setup"
    echo "  ./nohms-docs.sh update \"Nuevas evaluaciones agregadas\""
    echo "  ./nohms-docs.sh deploy"
}

# Función para verificar dependencias
check_dependencies() {
    echo -e "${BLUE}🔍 Verificando dependencias...${NC}"
    
    # Verificar Node.js
    if ! command -v node &> /dev/null; then
        echo -e "${RED}❌ Node.js no está instalado${NC}"
        exit 1
    fi
    
    # Verificar npm
    if ! command -v npm &> /dev/null; then
        echo -e "${RED}❌ npm no está instalado${NC}"
        exit 1
    fi
    
    # Verificar git
    if ! command -v git &> /dev/null; then
        echo -e "${RED}❌ git no está instalado${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Todas las dependencias están instaladas${NC}"
}

# Función para configurar credenciales Git
setup_git_credentials() {
    echo -e "${BLUE}🔐 Configurando credenciales Git...${NC}"
    
    # Verificar si ya está configurado
    if git config --get credential.helper > /dev/null 2>&1; then
        echo -e "${GREEN}✅ Git credential helper ya configurado${NC}"
        return 0
    fi
    
    # Configurar credential helper
    git config --global credential.helper store
    echo -e "${GREEN}✅ Git credential helper configurado${NC}"
    echo -e "${YELLOW}💡 En el próximo push, se guardarán automáticamente tus credenciales${NC}"
}

# Función para verificar si necesita autenticación
check_git_auth() {
    # Intentar un fetch silencioso para verificar auth
    if ! git ls-remote origin > /dev/null 2>&1; then
        echo -e "${YELLOW}🔑 Credenciales Git requeridas${NC}"
        echo -e "${BLUE}ℹ️  Usa tu username de GitHub y tu Personal Access Token como password${NC}"
        echo -e "${BLUE}ℹ️  Crea un token en: https://github.com/settings/tokens${NC}"
        return 1
    fi
    return 0
}

# Función de setup inicial
setup_project() {
    echo -e "${BLUE}🛠️  Configurando proyecto NOHMS.One...${NC}"
    
    check_dependencies
    
    # Verificar si es un repo git
    if [ ! -d ".git" ]; then
        echo -e "${YELLOW}📁 Inicializando repositorio Git...${NC}"
        git init
        git remote add origin $REPO_URL
    fi
    
    # Configurar credenciales Git
    setup_git_credentials
    
    # Instalar dependencias si no existen
    if [ ! -d "node_modules" ]; then
        echo -e "${YELLOW}📦 Instalando dependencias npm...${NC}"
        npm install
    fi
    
    # Verificar archivos principales (buscar tanto .js como .ts)
    if [ ! -f "docusaurus.config.js" ] && [ ! -f "docusaurus.config.ts" ]; then
        echo -e "${RED}❌ Archivo de configuración de Docusaurus no encontrado${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ Setup completado exitosamente${NC}"
    echo -e "${BLUE}🌐 Para iniciar desarrollo: ./nohms-docs.sh dev${NC}"
}

# Función para ver status
show_status() {
    echo -e "${BLUE}📊 Estado del proyecto NOHMS.One${NC}"
    echo ""
    
    # Git status
    echo -e "${YELLOW}Git Status:${NC}"
    git status --short
    echo ""
    
    # Branch actual
    echo -e "${YELLOW}Branch actual:${NC} $(git branch --show-current)"
    
    # Último commit
    echo -e "${YELLOW}Último commit:${NC}"
    git log --oneline -n 1
    echo ""
    
    # Estado de archivos
    if [ -d "$BUILD_DIR" ]; then
        echo -e "${GREEN}✅ Build directory existe${NC}"
    else
        echo -e "${YELLOW}⚠️  No hay build generado${NC}"
    fi
    
    # Verificar si hay cambios pendientes
    if git diff-index --quiet HEAD --; then
        echo -e "${GREEN}✅ No hay cambios pendientes${NC}"
    else
        echo -e "${YELLOW}⚠️  Hay cambios sin commitear${NC}"
    fi
}

# Función para build
build_docs() {
    echo -e "${BLUE}🔨 Compilando documentación...${NC}"
    
    check_dependencies
    
    # Limpiar build anterior
    if [ -d "$BUILD_DIR" ]; then
        rm -rf $BUILD_DIR
        echo -e "${YELLOW}🧹 Build anterior eliminado${NC}"
    fi
    
    # Build
    npm run build
    
    if [ -d "$BUILD_DIR" ]; then
        echo -e "${GREEN}✅ Build completado exitosamente${NC}"
        echo -e "${BLUE}📁 Archivos generados en: $BUILD_DIR/${NC}"
    else
        echo -e "${RED}❌ Error en el build${NC}"
        exit 1
    fi
}

# Función para servidor de desarrollo
start_dev() {
    echo -e "${BLUE}🚀 Iniciando servidor de desarrollo...${NC}"
    echo -e "${GREEN}🌐 Abrirá en: http://localhost:3000${NC}"
    echo -e "${YELLOW}💡 Presiona Ctrl+C para detener${NC}"
    
    npm start
}

# Función para update (commit + push)
update_project() {
    local commit_message="${1:-Actualización de documentación}"
    
    echo -e "${BLUE}📤 Actualizando proyecto...${NC}"
    
    # Verificar si hay cambios
    if git diff-index --quiet HEAD --; then
        echo -e "${YELLOW}⚠️  No hay cambios para commitear${NC}"
        return 0
    fi
    
    # Mostrar cambios
    echo -e "${YELLOW}📋 Cambios detectados:${NC}"
    git status --short
    echo ""
    
    # Confirmar
    read -p "¿Continuar con el commit? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}⏹️  Operación cancelada${NC}"
        return 0
    fi
    
    # Add y commit
    git add .
    git commit -m "$commit_message"
    
    echo -e "${BLUE}📤 Subiendo cambios a GitHub...${NC}"
    
    # Verificar auth antes del push
    if ! check_git_auth; then
        echo -e "${YELLOW}🔐 Se solicitarán credenciales en el push...${NC}"
    fi
    
    # Push con manejo de errores
    if git push origin $BRANCH; then
        echo -e "${GREEN}✅ Proyecto actualizado exitosamente${NC}"
        echo -e "${BLUE}🌐 Los cambios estarán en Vercel en 1-2 minutos${NC}"
        echo -e "${BLUE}🔗 URL: https://nohms-docs-oceancryptoalama.vercel.app${NC}"
    else
        echo -e "${RED}❌ Error en el push. Verifica tus credenciales${NC}"
        echo -e "${YELLOW}💡 Configura un Personal Access Token: https://github.com/settings/tokens${NC}"
        exit 1
    fi
}

# Función para deploy completo
deploy_project() {
    echo -e "${BLUE}🚀 Deploy completo iniciado...${NC}"
    
    # 1. Build
    build_docs
    
    # 2. Update
    local commit_message="${1:-Deploy: $(date '+%Y-%m-%d %H:%M')}"
    update_project "$commit_message"
    
    echo -e "${GREEN}✅ Deploy completado${NC}"
    echo -e "${BLUE}🌐 Sitio web: https://nohms-docs.vercel.app${NC}"
}

# Función para limpiar
clean_project() {
    echo -e "${BLUE}🧹 Limpiando archivos temporales...${NC}"
    
    # Limpiar build
    if [ -d "$BUILD_DIR" ]; then
        rm -rf $BUILD_DIR
        echo -e "${GREEN}✅ Build directory eliminado${NC}"
    fi
    
    # Limpiar cache de npm
    npm run clear 2>/dev/null || echo -e "${YELLOW}⚠️  No hay comando clear disponible${NC}"
    
    # Limpiar node_modules si se solicita
    read -p "¿Eliminar node_modules? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf node_modules
        echo -e "${GREEN}✅ node_modules eliminado${NC}"
        echo -e "${BLUE}💡 Ejecuta 'npm install' antes del próximo uso${NC}"
    fi
}

# Función para backup
backup_project() {
    local backup_dir="backups"
    local timestamp=$(date '+%Y%m%d_%H%M%S')
    local backup_name="nohms-docs_backup_$timestamp"
    
    echo -e "${BLUE}💾 Creando backup...${NC}"
    
    mkdir -p "$backup_dir"
    
    # Crear tar.gz excluyendo node_modules y build
    tar -czf "$backup_dir/$backup_name.tar.gz" \
        --exclude='node_modules' \
        --exclude='build' \
        --exclude='.git' \
        --exclude='backups' \
        .
    
    echo -e "${GREEN}✅ Backup creado: $backup_dir/$backup_name.tar.gz${NC}"
}

# Función para logs
show_logs() {
    echo -e "${BLUE}📜 Últimos commits:${NC}"
    git log --oneline --graph -n 10
}

# Función para comandos de Vercel
vercel_commands() {
    echo -e "${BLUE}🔷 Comandos de Vercel${NC}"
    echo ""
    echo "1. Instalar Vercel CLI:"
    echo "   npm install -g vercel"
    echo ""
    echo "2. Login:"
    echo "   vercel login"
    echo ""
    echo "3. Deploy manual:"
    echo "   vercel --prod"
    echo ""
    echo "4. Ver deployments:"
    echo "   vercel list"
    echo ""
    echo "5. Ver logs:"
    echo "   vercel logs"
    echo ""
    echo -e "${YELLOW}💡 Tip: El deploy automático funciona con git push${NC}"
}

# Función para comandos de Git útiles
git_commands() {
    echo -e "${BLUE}🔧 Comandos Git útiles para NOHMS${NC}"
    echo ""
    echo "Configuración de credenciales:"
    echo "   git config --global credential.helper store"
    echo ""
    echo "Verificar configuración:"
    echo "   git config --list | grep credential"
    echo ""
    echo "Ver estado del repositorio:"
    echo "   git status"
    echo ""
    echo "Ver historial:"
    echo "   git log --oneline -10"
    echo ""
    echo "Verificar conexión con GitHub:"
    echo "   git ls-remote origin"
    echo ""
    echo "Personal Access Token:"
    echo "   https://github.com/settings/tokens"
    echo ""
    echo -e "${YELLOW}💡 Tip: Después del primer push exitoso, las credenciales se guardan automáticamente${NC}"
}

# Función principal
main() {
    case "${1:-help}" in
        "setup")
            setup_project
            ;;
        "status")
            show_status
            ;;
        "build")
            build_docs
            ;;
        "dev")
            start_dev
            ;;
        "update")
            update_project "$2"
            ;;
        "deploy")
            deploy_project "$2"
            ;;
        "clean")
            clean_project
            ;;
        "backup")
            backup_project
            ;;
        "logs")
            show_logs
            ;;
        "vercel")
            vercel_commands
            ;;
        "git")
            git_commands
            ;;
        "help"|*)
            show_help
            ;;
    esac
}

# Ejecutar función principal con todos los argumentos
main "$@"

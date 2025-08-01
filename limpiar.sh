#!/bin/bash

# 🔒 SCRIPT PARA LIMPIAR TOKEN DEL HISTORIAL GIT
echo "🔒 Limpiando token del historial de Git..."

# 1. Eliminar .env del repositorio actual
echo "📁 Eliminando .env del seguimiento de Git..."
git rm --cached .env 2>/dev/null || echo "⚠️ .env ya no está en seguimiento"

# 2. Asegurar que .env esté en .gitignore
echo "📝 Verificando .gitignore..."
if ! grep -q "^\.env$" .gitignore; then
    echo ".env" >> .gitignore
    echo "✅ .env agregado a .gitignore"
else
    echo "✅ .env ya está en .gitignore"
fi

# 3. Commit para eliminar .env del índice
echo "💾 Commiteando eliminación de .env..."
git add .gitignore
git commit -m "Security: Remove .env from repository and ensure it's ignored"

# 4. Limpiar historial con filter-repo (método más seguro)
if command -v git-filter-repo &> /dev/null; then
    echo "🧹 Limpiando .env del historial completo..."
    git-filter-repo --path .env --invert-paths --force
    echo "✅ Historial limpiado con git-filter-repo"
else
    echo "⚠️ git-filter-repo no está instalado"
    echo "💡 Instalando git-filter-repo..."
    
    # Intentar instalarlo
    if command -v pip3 &> /dev/null; then
        pip3 install git-filter-repo
        echo "🧹 Limpiando .env del historial completo..."
        git-filter-repo --path .env --invert-paths --force
        echo "✅ Historial limpiado"
    else
        echo "❌ No se puede instalar git-filter-repo automáticamente"
        echo "🔧 Método alternativo: BFG Repo Cleaner"
        echo ""
        echo "Ejecuta manualmente:"
        echo "1. pip3 install git-filter-repo"
        echo "2. git-filter-repo --path .env --invert-paths --force"
        echo "3. git push origin main --force"
        exit 1
    fi
fi

# 5. Intentar push forzado
echo "📤 Intentando push con historial limpio..."
git push origin main --force

if [ $? -eq 0 ]; then
    echo "✅ ¡Push exitoso! Token eliminado del historial"
    echo "🌐 Vercel debería deployar en 2-3 minutos"
    echo "🔗 https://nohms-docs-oceancryptoalama.vercel.app"
else
    echo "❌ Push falló, intenta el método manual"
    echo ""
    echo "🔧 MÉTODO MANUAL:"
    echo "1. Ve a: https://github.com/OceanCryptoAlAma/nohms-docs/security/secret-scanning/unblock-secret/30h164R8JJ76PI4rK69qGPDzBiQ"
    echo "2. Click en 'Allow secret'"
    echo "3. Después ejecuta: git push origin main"
fi

echo ""
echo "🔐 IMPORTANTE: Regenera tu Personal Access Token"
echo "   https://github.com/settings/tokens"
echo "   Y actualiza tu archivo .env local"

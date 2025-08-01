#!/bin/bash

# 🔍 DIAGNÓSTICO NOHMS HOMEPAGE
echo "🔍 Diagnosticando problema de homepage..."

echo "1️⃣ Verificando archivos principales:"
ls -la src/pages/
echo "📄 index.tsx existe:" && [ -f "src/pages/index.tsx" ] && echo "✅ SÍ" || echo "❌ NO"
echo "📄 index.js existe:" && [ -f "src/pages/index.js" ] && echo "✅ SÍ" || echo "❌ NO"

echo -e "\n2️⃣ Estado de Git:"
git status --porcelain

echo -e "\n3️⃣ Últimos commits que afectan homepage:"
git log --oneline -5 -- src/pages/

echo -e "\n4️⃣ Verificando .gitignore:"
echo "¿src/pages/ está ignorado?"
git check-ignore src/pages/ && echo "❌ SÍ (PROBLEMA)" || echo "✅ NO"

echo -e "\n5️⃣ Verificando diferencias con remoto:"
git diff HEAD origin/main -- src/pages/

# 🚀 SOLUCIÓN AUTOMÁTICA
echo -e "\n🚀 EJECUTANDO SOLUCIÓN:"

echo "Step 1: Verificando cambios pendientes..."
if ! git diff-index --quiet HEAD --; then
    echo "📤 Hay cambios pendientes, subiendo..."
    ./nohms-docs.sh update "Fix: Sincronizar homepage con Vercel"
else
    echo "✅ No hay cambios pendientes"
fi

echo -e "\nStep 2: Forzar redeploy en Vercel..."
echo "🔄 Ve a https://vercel.com/oceancryptoalama/nohms-docs"
echo "   1. Click en el último deployment"
echo "   2. Click en '...' → 'Redeploy'"
echo "   3. Selecciona 'Use existing Build Cache: NO'"

echo -e "\nStep 3: Verificar configuración Vercel:"
echo "📋 Verifica en Vercel Dashboard:"
echo "   - Build Command: npm run build"
echo "   - Output Directory: build"
echo "   - Install Command: npm install"

echo -e "\n🔧 Si el problema persiste, ejecuta:"
echo "   git push --force-with-lease origin main"

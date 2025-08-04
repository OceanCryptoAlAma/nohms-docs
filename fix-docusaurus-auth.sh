#!/bin/bash

# 🔧 NOHMS.One - Fix Autenticación Docusaurus
# Docusaurus requiere configuración específica para middleware

set -e

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🔧 Configurando autenticación para Docusaurus...${NC}"

# Paso 1: Eliminar middleware.js (no funciona en Docusaurus)
if [ -f "middleware.js" ]; then
    mv middleware.js middleware.js.backup
    echo -e "${YELLOW}📁 middleware.js movido a backup${NC}"
fi

# Paso 2: Crear plugin de autenticación personalizado
mkdir -p plugins/auth-plugin

cat > plugins/auth-plugin/index.js << 'PLUGINEOF'
const path = require('path');

module.exports = function(context, options) {
  return {
    name: 'nohms-auth-plugin',
    configureWebpack(config, isServer, utils) {
      return {
        plugins: [
          new utils.webpack.DefinePlugin({
            NOHMS_AUTH_ENABLED: JSON.stringify(true)
          })
        ]
      };
    },
    injectHtmlTags() {
      return {
        headTags: [
          {
            tagName: 'script',
            innerHTML: `
              (function() {
                // Configuración de autenticación
                const AUTH_CONFIG = {
                  username: 'nohms',
                  password: 'movilidad2025',
                  realm: 'NOHMS.One Documentation'
                };
                
                // Verificar si ya está autenticado
                function isAuthenticated() {
                  return sessionStorage.getItem('nohms_auth_token') === btoa(AUTH_CONFIG.username + ':' + AUTH_CONFIG.password);
                }
                
                // Solicitar credenciales
                function authenticate() {
                  const credentials = prompt(
                    'Acceso restringido - NOHMS.One Documentation\\n\\n' +
                    'Ingrese las credenciales en formato: usuario:contraseña'
                  );
                  
                  if (!credentials) {
                    document.body.innerHTML = '<div style="text-align:center;padding:50px;font-family:Arial,sans-serif;"><h1>🔐 Acceso Restringido</h1><p>Esta documentación requiere autenticación.</p><button onclick="location.reload()">Intentar nuevamente</button></div>';
                    return false;
                  }
                  
                  const expectedCreds = AUTH_CONFIG.username + ':' + AUTH_CONFIG.password;
                  
                  if (credentials === expectedCreds) {
                    sessionStorage.setItem('nohms_auth_token', btoa(credentials));
                    return true;
                  } else {
                    alert('Credenciales incorrectas. Inténtelo nuevamente.');
                    return authenticate();
                  }
                }
                
                // Ejecutar autenticación al cargar la página
                if (!isAuthenticated()) {
                  if (!authenticate()) {
                    // Si no se autentica, no cargar el contenido
                    return;
                  }
                }
                
                // Agregar botón de logout
                document.addEventListener('DOMContentLoaded', function() {
                  const navbar = document.querySelector('.navbar__items--right');
                  if (navbar) {
                    const logoutBtn = document.createElement('button');
                    logoutBtn.innerHTML = '🚪 Salir';
                    logoutBtn.style.cssText = 'background:none;border:1px solid #ccc;padding:5px 10px;margin-left:10px;cursor:pointer;border-radius:4px;';
                    logoutBtn.onclick = function() {
                      sessionStorage.removeItem('nohms_auth_token');
                      location.reload();
                    };
                    navbar.appendChild(logoutBtn);
                  }
                });
                
              })();
            `
          }
        ]
      };
    }
  };
};
PLUGINEOF

echo -e "${GREEN}✅ Plugin de autenticación creado${NC}"

# Paso 3: Actualizar docusaurus.config.ts para incluir el plugin
echo -e "${YELLOW}🔧 Actualizando configuración de Docusaurus...${NC}"

# Backup del config actual
cp docusaurus.config.ts docusaurus.config.ts.backup

# Crear nuevo config con el plugin
cat > docusaurus.config.ts << 'CONFIGEOF'
import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'NOHMS.One',
  tagline: 'Recuperá tu libertad de moverte',
  favicon: 'img/favicon.ico',

  url: 'https://docs.nohms.one',
  baseUrl: '/',

  organizationName: 'nohms-digital',
  projectName: 'nohms-docs',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  i18n: {
    defaultLocale: 'es',
    locales: ['es', 'en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
        },
        blog: {
          showReadingTime: true,
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    // Plugin de autenticación NOHMS
    './plugins/auth-plugin'
  ],

  themeConfig: {
      image: 'img/nohms-social-card.jpg',
      navbar: {
        title: 'NOHMS.One',
        logo: {
          alt: 'NOHMS Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'proyectoSidebar',
            position: 'left',
            label: 'Proyecto',
          },
          {
            type: 'docSidebar',
            sidebarId: 'metodologiaSidebar',
            position: 'left',
            label: 'Metodología',
          },
          {
            type: 'docSidebar',
            sidebarId: 'plataformaSidebar',
            position: 'left',
            label: 'Plataforma',
          },
          {
            type: 'docSidebar',
            sidebarId: 'desarrolloSidebar',
            position: 'left',
            label: 'Desarrollo',
          },
          {to: '/blog', label: 'Blog', position: 'left'},
          {
            href: 'https://github.com/OceanCryptoAlAma/nohms-docs',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Documentación',
            items: [
              {
                label: 'Introducción',
                to: '/docs/intro',
              },
              {
                label: 'Visión del Proyecto',
                to: '/docs/proyecto/vision-problema',
              },
            ],
          },
          {
            title: 'Comunidad',
            items: [
              {
                label: 'Discord',
                href: 'https://discord.gg/nohms',
              },
              {
                label: 'Twitter',
                href: 'https://twitter.com/nohms_digital',
              },
            ],
          },
          {
            title: 'Más',
            items: [
              {
                label: 'Blog',
                to: '/blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/OceanCryptoAlAma/nohms-docs',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} NOHMS Digital.`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    } satisfies Preset.ThemeConfig,
};

export default config;
CONFIGEOF

echo -e "${GREEN}✅ Configuración actualizada${NC}"

# Paso 4: Crear página de instrucciones de acceso
mkdir -p src/pages
cat > src/pages/acceso.md << 'ACCESSEOF'
---
title: Información de Acceso
description: Credenciales para la documentación NOHMS.One
---

# 🔐 Acceso a la Documentación

## Credenciales de Acceso

Cuando accedas al sitio, ingresa las credenciales en formato `usuario:contraseña`:

**nohms:movilidad2025**

## Instrucciones

1. Al cargar cualquier página, aparecerá un prompt solicitando credenciales
2. Ingresa exactamente: `nohms:movilidad2025`
3. Una vez autenticado, podrás navegar libremente
4. Para cerrar sesión, haz clic en el botón "🚪 Salir" en la barra superior

## Problemas de Acceso

- Asegúrate de ingresar las credenciales exactamente como se muestran
- Si tienes problemas, recarga la página (F5)
- La sesión se mantiene hasta que cierres el navegador o hagas logout

---

*Documentación técnica NOHMS.One - Acceso restringido al equipo autorizado*
ACCESSEOF

echo ""
echo -e "${BLUE}🎉 ¡Configuración completada!${NC}"
echo ""
echo -e "${YELLOW}📋 CREDENCIALES:${NC}"
echo -e "${GREEN}   Formato: usuario:contraseña${NC}"
echo -e "${GREEN}   Credenciales: nohms:movilidad2025${NC}"
echo ""
echo -e "${YELLOW}🧪 PROBAR AHORA:${NC}"
echo -e "${BLUE}   ./nohms-docs.sh dev${NC}"
echo ""
echo -e "${YELLOW}🚀 DESPLEGAR:${NC}"
echo -e "${BLUE}   ./nohms-docs.sh deploy \"Autenticación implementada\"${NC}"
echo ""
echo -e "${YELLOW}🔧 CAMBIAR CREDENCIALES:${NC}"
echo -e "${BLUE}   Editar: plugins/auth-plugin/index.js (líneas 17-18)${NC}"


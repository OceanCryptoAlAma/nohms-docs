import React from 'react';
import { useEffect } from 'react';

// Componente Root personalizado para autenticación
export default function Root({children}) {
  useEffect(() => {
    // Script de autenticación NOHMS.One
    const initAuth = () => {
      const AUTH_CONFIG = {
        username: 'nohms',
        password: 'movilidad2025',
        sessionKey: 'nohms_auth_token'
      };
      
      const isAuthenticated = () => {
        const token = sessionStorage.getItem(AUTH_CONFIG.sessionKey);
        const expectedToken = btoa(AUTH_CONFIG.username + ':' + AUTH_CONFIG.password);
        return token === expectedToken;
      };
      
      const authenticate = () => {
        const message = '🔐 NOHMS.One - Documentación Restringida\n\nIngrese las credenciales en formato usuario:contraseña';
        const credentials = prompt(message);
        
        if (!credentials) {
          showAccessDenied();
          return false;
        }
        
        if (!credentials.includes(':')) {
          alert('❌ Formato incorrecto. Use: usuario:contraseña');
          return authenticate();
        }
        
        const [inputUser, inputPass] = credentials.split(':');
        
        if (inputUser === AUTH_CONFIG.username && inputPass === AUTH_CONFIG.password) {
          sessionStorage.setItem(AUTH_CONFIG.sessionKey, btoa(credentials));
          return true;
        } else {
          alert('❌ Credenciales incorrectas. Inténtelo nuevamente.');
          return authenticate();
        }
      };
      
      const showAccessDenied = () => {
        document.body.innerHTML = 
          '<div style="text-align:center;padding:50px;font-family:-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,sans-serif;max-width:600px;margin:0 auto;">' +
          '<h1 style="color:#e74c3c;margin-bottom:20px;">🔐 Acceso Restringido</h1>' +
          '<p style="font-size:18px;color:#555;margin-bottom:30px;">Esta documentación requiere autenticación válida.</p>' +
          '<div style="background:#f8f9fa;padding:20px;border-radius:8px;margin:20px 0;">' +
          '<p><strong>Formato requerido:</strong></p>' +
          '<code style="background:#e9ecef;padding:5px 10px;border-radius:4px;">usuario:contraseña</code>' +
          '<p style="margin-top:15px;font-size:14px;color:#666;">Contacte al administrador para obtener credenciales</p>' +
          '</div>' +
          '<button onclick="location.reload()" style="background:#3498db;color:white;border:none;padding:12px 24px;border-radius:6px;cursor:pointer;font-size:16px;">🔄 Intentar Nuevamente</button>' +
          '<div style="margin-top:30px;padding-top:20px;border-top:1px solid #eee;color:#666;font-size:14px;">' +
          '<p>NOHMS.One - Plataforma de Evaluación Funcional con IA</p>' +
          '</div>' +
          '</div>';
      };
      
      const addLogoutButton = () => {
        setTimeout(() => {
          const navbar = document.querySelector('.navbar__items--right') || 
                        document.querySelector('.navbar__items') ||
                        document.querySelector('.navbar');
          
          if (navbar && !document.getElementById('nohms-logout-btn')) {
            const logoutBtn = document.createElement('button');
            logoutBtn.id = 'nohms-logout-btn';
            logoutBtn.innerHTML = '🚪 Salir';
            logoutBtn.style.cssText = 
              'background: none; border: 1px solid #ccc; padding: 6px 12px; ' +
              'margin-left: 10px; cursor: pointer; border-radius: 4px; ' +
              'font-size: 14px; transition: all 0.2s;';
            
            logoutBtn.onmouseover = function() { this.style.background = '#f0f0f0'; };
            logoutBtn.onmouseout = function() { this.style.background = 'none'; };
            logoutBtn.onclick = function() {
              if (confirm('¿Cerrar sesión y salir de la documentación?')) {
                sessionStorage.removeItem(AUTH_CONFIG.sessionKey);
                location.reload();
              }
            };
            
            navbar.appendChild(logoutBtn);
          }
        }, 1000);
      };
      
      // Ejecutar autenticación
      if (!isAuthenticated()) {
        if (!authenticate()) {
          return;
        }
      }
      
      addLogoutButton();
    };
    
    // Iniciar autenticación
    initAuth();
  }, []);

  return <>{children}</>;
}

import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {
  // Sidebar principal del tutorial
  tutorialSidebar: [
    'intro',
  ],

  // Nueva sección del proyecto
  proyectoSidebar: [
    'proyecto/vision-problema',  
  ],

  // MANUAL DEL EVALUADOR EPN® - REAL
  metodologiaSidebar: [
    'manual-evaluador/index',
    {
      type: 'category',
      label: 'Fundamentos',
      items: [
        'manual-evaluador/fundamentos/index',
      ],
    },
    {
      type: 'category',
      label: 'Guía Fotográfica',
      items: [
        'manual-evaluador/guia-fotografica/index',
        'manual-evaluador/guia-fotografica/evaluaciones-posturales',
      ],
    },
    {
      type: 'category',
      label: 'Protocolo de Entrevista',
      items: [
        'manual-evaluador/protocolo-entrevista/index',
        'manual-evaluador/protocolo-entrevista/cuestionario-epn',
      ],
    },
    {
      type: 'category',
      label: 'Evaluaciones',
      items: [
        'manual-evaluador/evaluaciones/index',
        {
          type: 'category',
          label: 'Evaluaciones Posturales',
          items: [
            'manual-evaluador/evaluaciones/postura/index',
            'manual-evaluador/evaluaciones/postura/analisis-postural-estatico',
          ],
        },
      ],
    },
  ],

  // Plataforma digital
  plataformaSidebar: [
    'plataforma/vision-general',
    'plataforma/arquitectura',
    {
      type: 'category',
      label: 'Módulos del Sistema',
      items: [
        'plataforma/modulos/evaluacion-ia',
        'plataforma/modulos/generador-planes',
        'plataforma/modulos/coaching-hibrido',
        'plataforma/modulos/chatbot-rag',
        'plataforma/modulos/web3-tokens',
      ],
    },
    'plataforma/mvp',
  ],

  // Desarrollo técnico
  desarrolloSidebar: [
    'desarrollo/setup-desarrollo',
    'desarrollo/arquitectura-tecnica',
    'desarrollo/ia-mediapipe',
    'desarrollo/api-reference',
    'desarrollo/deployment',
  ],
};

export default sidebars;

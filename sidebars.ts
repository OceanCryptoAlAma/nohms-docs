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

  // Metodología NOHMS®
  metodologiaSidebar: [
    'metodologia/introduccion',
    {
      type: 'category',
      label: 'Evaluaciones NOHMS®',
      items: [
        'metodologia/evaluaciones/postura-estatica',
        'metodologia/evaluaciones/flexion-extension', 
        'metodologia/evaluaciones/movilidad-caderas',
        'metodologia/evaluaciones/columna-vertebral',
        'metodologia/evaluaciones/hombros-escapulas',
        'metodologia/evaluaciones/tobillos-pies',
        'metodologia/evaluaciones/coordinacion-motora',
      ],
    },
    'metodologia/protocolos',
    'metodologia/validacion-clinica',
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

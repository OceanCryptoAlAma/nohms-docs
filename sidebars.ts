/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */

// @ts-check

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  // By default, Docusaurus generates a sidebar from the docs folder structure
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

  desarrolloSidebar: [
    'desarrollo/setup-desarrollo',
    'desarrollo/arquitectura-tecnica',
    'desarrollo/ia-mediapipe',
    'desarrollo/api-reference',
    'desarrollo/deployment',
  ],
};

module.exports = sidebars;

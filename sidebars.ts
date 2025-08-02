import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {
  tutorialSidebar: ['intro'],
  proyectoSidebar: ['proyecto/vision-problema'],

  // MANUAL DEL EVALUADOR EPN® - COMPLETO
  metodologiaSidebar: [
    'manual-evaluador/index',
    {
      type: 'category',
      label: 'Fundamentos',
      items: ['manual-evaluador/fundamentos/index'],
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
      label: 'Evaluaciones EPN®',
      items: [
        'manual-evaluador/evaluaciones/index',
        {
          type: 'category',
          label: 'Evaluaciones Posturales',
          items: [
            'manual-evaluador/evaluaciones/postura/index',
            'manual-evaluador/evaluaciones/postura/analisis-postural-estatico',
            'manual-evaluador/evaluaciones/postura/secuencia-enderezamiento-vertebral',
          ],
        },
        {
          type: 'category',
          label: 'Evaluaciones de Movilidad',
          items: [
            'manual-evaluador/evaluaciones/movilidad/index',
            'manual-evaluador/evaluaciones/movilidad/flexibilidad-sentado-piernas-estiradas',
            'manual-evaluador/evaluaciones/movilidad/flexibilidad-sentado-piernas-dobladas',
            'manual-evaluador/evaluaciones/movilidad/flexibilidad-sentado-lateral',
            'manual-evaluador/evaluaciones/movilidad/posicion-loto-cruzado',
            'manual-evaluador/evaluaciones/movilidad/piernas-abiertas-estiradas',
            'manual-evaluador/evaluaciones/movilidad/rotacion-espinal-acostado',
            'manual-evaluador/evaluaciones/movilidad/lomos-de-gato',
            'manual-evaluador/evaluaciones/movilidad/test-numero-4-cadera',
            'manual-evaluador/evaluaciones/movilidad/estiramiento-isquiotibiales',
            'manual-evaluador/evaluaciones/movilidad/flexion-tobillo-pared',
          ],
        },
        {
          type: 'category',
          label: 'Evaluaciones de Fuerza',
          items: [
            'manual-evaluador/evaluaciones/fuerza/index',
            'manual-evaluador/evaluaciones/fuerza/test-suspension-colgado',
            'manual-evaluador/evaluaciones/fuerza/puente-frontal-plancha',
            'manual-evaluador/evaluaciones/fuerza/inclinacion-90-grados-escuadra',
            'manual-evaluador/evaluaciones/fuerza/extension-brazos-boca-abajo',
            'manual-evaluador/evaluaciones/fuerza/brazos-cruz-boca-abajo',
          ],
        },
        {
          type: 'category',
          label: 'Evaluaciones Funcionales',
          items: [
            'manual-evaluador/evaluaciones/funcional/index',
            'manual-evaluador/evaluaciones/funcional/sentadilla-profunda',
            'manual-evaluador/evaluaciones/funcional/secuencia-ascenso-sentadilla',
            'manual-evaluador/evaluaciones/funcional/desplante-salida-carrera',
            'manual-evaluador/evaluaciones/funcional/desplante-lateral',
            'manual-evaluador/evaluaciones/funcional/equilibrio-una-pierna',
          ],
        },
      ],
    },
    {
      type: 'category',
      label: 'Casos de Estudio',
      items: [
        'manual-evaluador/casos-estudio/index',
        'manual-evaluador/casos-estudio/caso-deportista',
        'manual-evaluador/casos-estudio/caso-adulto-mayor',
        'manual-evaluador/casos-estudio/caso-rehabilitacion',
      ],
    },
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

export default sidebars;

import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Evaluación por IA',
    Svg: require('@site/static/img/undraw_docusaurus_mountain.svg').default,
    description: (
      <>
        Sistema de análisis postural usando MediaPipe y computer vision para detectar 
        patrones de movimiento y compensaciones basado en +30 evaluaciones clínicas.
      </>
    ),
  },
  {
    title: 'Metodología Validada',
    Svg: require('@site/static/img/undraw_docusaurus_tree.svg').default,
    description: (
      <>
        Más de 10 años de desarrollo clínico del método NOHMS® por Nicolás Ogues.
        Protocolos precisos y validados para recuperar la libertad de movimiento natural.
      </>
    ),
  },
  {
    title: 'Coaching Híbrido',
    Svg: require('@site/static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        Combinación de IA y profesionales certificados NOHMS® para acompañamiento 
        personalizado. La tecnología potencia la experiencia humana.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
        
        {/* Sección adicional con información del proyecto */}
        <div className="row margin-top--lg">
          <div className="col col--12">
            <div className="text--center">
              <Heading as="h2">El Problema que Solucionamos</Heading>
              <p className="margin-bottom--lg">
                Vivimos en una sociedad cada vez más inmóvil. Cuando buscamos "ponernos en forma", 
                muchas veces terminamos en gimnasios que desarrollan fuerza pero no movilidad, 
                y frecuentemente nos lesionamos por falta de una base funcional.
              </p>
              
              <div className="row">
                <div className="col col--6">
                  <div className="card">
                    <div className="card__header">
                      <h3>🎯 Nuestra Misión</h3>
                    </div>
                    <div className="card__body">
                      <p>
                        Recuperar la libertad de movimiento natural que teníamos de niños: 
                        agacharse, levantarse, girar, estirarse sin dolor ni restricciones.
                      </p>
                    </div>
                  </div>
                </div>
                
                <div className="col col--6">
                  <div className="card">
                    <div className="card__header">
                      <h3>🚀 Nuestra Solución</h3>
                    </div>
                    <div className="card__body">
                      <p>
                        Un sistema que, gracias a la IA, pone un experto en casa, 
                        accesible 24/7. Evalúa, entrena y hace seguimiento personalizado.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

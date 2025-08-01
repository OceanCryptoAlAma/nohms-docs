import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import HomepageFeatures from '@site/src/components/HomepageFeatures';
import Heading from '@theme/Heading';

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          {siteConfig.title}
        </Heading>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.heroDescription}>
          <p>
            Una plataforma digital que transforma el método clínico NOHMS® en una experiencia 
            accesible, inteligente y personalizada para evaluar y mejorar la movilidad humana.
          </p>
        </div>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/docs/intro">
            Conocer NOHMS.One - 5min ⏱️
          </Link>
          <Link
            className="button button--primary button--lg"
            to="/docs/proyecto/vision-problema">
            Ver el Proyecto 🚀
          </Link>
        </div>
      </div>
    </header>
  );
}

export default function Home(): JSX.Element {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title} - Documentación`}
      description="Plataforma digital para evaluación y mejora de la movilidad humana usando IA y el método NOHMS®">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}

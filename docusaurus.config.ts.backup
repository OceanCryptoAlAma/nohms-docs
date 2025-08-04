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

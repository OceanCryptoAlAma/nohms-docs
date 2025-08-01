// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const {themes} = require('prism-react-renderer');
const lightCodeTheme = themes.github;
const darkCodeTheme = themes.dracula;

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'NOHMS.One',
  tagline: 'Recuperá tu libertad de moverte',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://docs.nohms.one',
  // Set the /<baseUrl>/ pathname under which your site is served
  baseUrl: '/',

  // GitHub pages deployment config.
  organizationName: 'nohms-digital',
  projectName: 'nohms-docs',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internalization, you can use this field to set useful
  // metadata like html lang. For example, if your site is Spanish:
  i18n: {
    defaultLocale: 'es',
    locales: ['es', 'en'],
  },

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl:
            'https://github.com/nohms-digital/nohms-docs/tree/main/packages/create-docusaurus/templates/shared/',
        },
        blog: {
          showReadingTime: true,
          editUrl:
            'https://github.com/nohms-digital/nohms-docs/tree/main/packages/create-docusaurus/templates/shared/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
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
            href: 'https://github.com/nohms-digital/nohms-docs',
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
                label: 'Metodología NOHMS®',
                to: '/docs/metodologia/introduccion',
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
                href: 'https://github.com/nohms-digital',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} NOHMS Digital. Construido con Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
};

module.exports = config;

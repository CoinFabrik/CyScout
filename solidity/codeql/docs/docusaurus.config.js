// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import { themes as prismThemes } from "prism-react-renderer";

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: "CyScout",
  tagline: "Coinfabrik reasearch on CodeQL",
  favicon: "img/favicon.ico",

  url: "https://coinfabrik.github.io",

  baseUrl: "/CyScout/",
  trailingSlash: false,

  organizationName: "CoinFabrik",
  projectName: "CyScout",
  deploymentBranch: "gh-pages",

  onBrokenLinks: "throw",
  onBrokenMarkdownLinks: "warn",

  i18n: {
    defaultLocale: "en",
    locales: ["en"],
  },

  presets: [
    [
      "classic",
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          routeBasePath: "/",
          sidebarPath: "./sidebars.js",
        },
        blog: {
          showReadingTime: true,
          feedOptions: {
            type: ["rss", "atom"],
            xslt: true,
          },
          onInlineTags: "warn",
          onInlineAuthors: "warn",
          onUntruncatedBlogPosts: "warn",
        },
        theme: {
          customCss: "./src/css/custom.css",
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: "img/docusaurus-social-card.jpg",
      navbar: {
        title: "CyScout",
        logo: {
          alt: "My Site Logo",
          src: "img/logo.svg",
        },
        /* items: [
          {
            type: "docSidebar",
            sidebarId: "tutorialSidebar",
            to: "/Classes",
            label: "Classes",
            position: "left",
          },
          {
            type: "docSidebar",
            sidebarId: "tutorialSidebar",
            to: "/Detectors",
            label: "Detectors",
            position: "left",
          },
        ], */
      },
      footer: {
        style: "dark",
        links: [
          {
            title: "Docs",
            items: [
              {
                label: "Classes",
                to: "/Classes",
              },
              {
                label: "Detectors",
                to: "/Detectors",
              },
            ],
          },
          {
            title: "Community",
            items: [
              {
                label: "GitHub",
                href: "https://github.com/CoinFabrik/CyScout",
              },
              {
                label: "CoinFabrik",
                href: "https://www.coinfabrik.com/",
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} CoinFabrik.`,
      },
      prism: {
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    }),
};

export default config;

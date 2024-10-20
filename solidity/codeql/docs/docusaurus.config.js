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
  favicon: "img/favicon.png",

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
      image: "img/CyScout-Social-Card.jpg",
      navbar: {
        logo: {
          alt: "Logo",
          src: "img/logo-dark.svg",
          srcDark: "img/logo-light.svg",
        },
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

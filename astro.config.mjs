// @ts-check
import { defineConfig } from "astro/config";
import sitemap from "@astrojs/sitemap";
import { typst } from "astro-typst";
import { URL_BASE } from "./config.json";

// https://astro.build/config
export default defineConfig({
  // Deploys to GitHub Pages
  site: "https://tzhtaylor.github.io",
  base: "/blog",

  integrations: [
    sitemap(),
    typst({
      // Always builds HTML files
      mode: {
        default: "html",
        detect: () => "html",
      },
    }),
  ],

  vite: {
    resolve: {
      alias: {
        "$styles": "/src/styles",
        "$components": "/src/components",
        "$layouts": "/src/layouts",
        "$consts": "/src/consts",
      },
    },
  },
});

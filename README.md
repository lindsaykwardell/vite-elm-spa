# Vite Elm SPA Template

[![ci](https://github.com/lindsaykwardell/vite-elm-spa/actions/workflows/ci.yml/badge.svg)](https://github.com/lindsaykwardell/vite-elm-spa/actions/workflows/ci.yml)
[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/lindsaykwardell/vite-elm-spa)

A default template for building Elm SPA applications using Vite. Includes hot-module reload of Elm modules (courtesy of `vite-plugin-elm`).

> Vite (French word for "fast", pronounced /vit/) is a build tool that aims to provide a faster and leaner development experience for modern web projects.

> Elm is a functional language that compiles to JavaScript. It helps you make websites and web apps. It has a strong emphasis on simplicity and quality tooling.

Live demo site: https://vite-elm-spa.netlify.app/

This template is based on [`vite-elm-template`](https://github.com/lindsaykwardell/vite-elm-spa)

## Features

- Allows for SPA architecture using [`orus-io/elm-spa`](https://package.elm-lang.org/packages/orus-io/elm-spa/latest/)
- Hot Module Reload of all code in the app (including Elm)
- Tooling installation via elm-tooling
  - Includes Elm, elm-format, elm-json, and elm-test-rs
- Basic unit test and elm-review examples
- Github Actions CI for running tests
- Recommends the Elm VS Code extension

## Get Started

```bash
# Clone the template locally, removing the template's Git log
npx degit lindsaykwardell/vite-elm-spa#main my-elm-app

# Enter the project, install dependencies, and get started!
cd my-elm-app
npm install
npm run dev
```

For more information about Vite, check out [Vite's official documentation.](https://vitejs.dev/)

To learn more about Elm, check out [Elm's official homepage](https://elm-lang.org/).

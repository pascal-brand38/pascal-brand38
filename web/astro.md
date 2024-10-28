Create a repo on github, without any files in it

npm create astro@latest -- --template basics
cd astro-proto
git remote add origin git@github.com:pascal-brand38/astro-proto.git
git remote -v
git push origin main


## SCSS

npm install sass
import '../scss/style.scss'


# Fonts

Go to https://fontsource.org/ to select the font you want, for example Kalam

npm install @fontsource/kalam

import '@fontsource/Kalam';


# Sprites

npm install astro-sprite

npx astro add astro-sprite

# Integration as local


```js
integrations: [
  {
    name: "path-denormalizer",
    hooks: {
      "astro:config:setup": function ({ config, updateConfig }) {
        console.log(config.base);

        return updateConfig({ base: "./" });
      },
      "astro:config:done": function ({ config }) {
        console.log(config.base);
      },
    },
  },
],
```

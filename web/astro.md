Create a repo on github, without any files in it

npm create astro@latest -- --template basics
cd astro-proto
git remote add origin git@github.com:pascal-brand38/astro-proto.git
git remote -v
git push origin main



npm create astro@latest -- --template portfolio


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

# Misc docs:
* [Pass Frontmatter variables to scripts](https://docs.astro.build/en/guides/client-side-scripts/#pass-frontmatter-variables-to-scripts)
* [Create a component on npm](https://github.com/withastro/astro/tree/0ae1365533909b403eddcf77b47895c8e3f5dfb2/examples/component/packages/my-component)

# Have a look at

* Performance analysis: https://astro-page-insight.pages.dev/others/demo/

# Choosing npm packages

In google, search for
```bash
site:npmtrends.com PhotoSwipe
```

This will show pages with PhotoSwipe, such as the one of PhotoSwipe, but also comparisons with alternatives

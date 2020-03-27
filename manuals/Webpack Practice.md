# Webpack Practice

https://webpack.js.org/

https://github.com/css-modules/css-modules

- **[Loaders](https://webpack.js.org/loaders/)**
- **[Plugins](https://webpack.js.org/plugins/)**

## [Installation](https://webpack.js.org/guides/installation/)

**Local Installation**
```bash
npm install --save-dev webpack
npm install --save-dev webpack@<version>
```

**Global Installation**
```bash
npm install --global webpack
```

## [API](https://webpack.js.org/api/)

### [Command Line Interface](https://webpack.js.org/api/cli/)

List all of the options available on the cli
```
webpack --help
webpack -h
```

Usage with config file
```
webpack [--config webpack.config.js]
```

Usage without config file
```
webpack <entry> [<entry>] <output>
```

## [Guides](https://webpack.js.org/guides/)

[Getting Started](https://webpack.js.org/guides/getting-started/)

[Asset Management](https://webpack.js.org/guides/asset-management/)

[Output Management](https://webpack.js.org/guides/output-management/)

## [Concepts](https://webpack.js.org/concepts/)

[Entry Points](https://webpack.js.org/concepts/entry-points/)

[Output](https://webpack.js.org/concepts/output/)

[Loaders](https://webpack.js.org/loaders/)

## [Configuration](https://webpack.js.org/configuration/)

### Samples

https://github.com/vuejs/vue-router/blob/dev/examples/webpack.config.js

### [Entry and Context](https://webpack.js.org/configuration/entry-context/)

[context](https://webpack.js.org/configuration/entry-context/#context) \
[entry](https://webpack.js.org/configuration/entry-context/#entry)

### [Output](https://webpack.js.org/configuration/output/)

[output.chunkFilename](https://webpack.js.org/configuration/output/#output-chunkfilename) \
[output.filename](https://webpack.js.org/configuration/output/#output-filename) \
[output.path](https://webpack.js.org/configuration/output/#output-path) \
[output.publicPath](https://webpack.js.org/configuration/output/#output-path)

### [Module](https://webpack.js.org/configuration/module/)

[module.rules](https://webpack.js.org/configuration/module/#module-rules) \
[Rule](https://webpack.js.org/configuration/module/#rule) \
[Rule.use](https://webpack.js.org/configuration/module/#rule-use) \
[Condition](https://webpack.js.org/configuration/module/#condition)

### [Resolve](https://webpack.js.org/configuration/resolve/)
[resolve](https://webpack.js.org/configuration/resolve/#resolve) \
[resolve.alias](https://webpack.js.org/configuration/resolve/#resolve-alias) \
[resolve.modules](https://webpack.js.org/configuration/resolve/#resolve-modules)

### [Plugins](https://webpack.js.org/configuration/plugins/)

[plugins](https://webpack.js.org/configuration/plugins/#plugins)

### [Devtool](https://webpack.js.org/configuration/devtool/)

[devtool](https://webpack.js.org/configuration/devtool/#devtool)

### [Node](https://webpack.js.org/configuration/node/)

[node](https://webpack.js.org/configuration/node/#node) \
[node.__dirname](https://webpack.js.org/configuration/node/#node-__dirname)

## [Examples](https://github.com/webpack/webpack/tree/master/examples)

## [Plugins](https://webpack.js.org/plugins/)

### [CommonsChunkPlugin](https://webpack.js.org/plugins/commons-chunk-plugin/)

https://github.com/ruanyf/webpack-demos#demo12-common-chunk-source

[DefinePlugin](https://webpack.js.org/plugins/define-plugin/)

## Tutorials

https://github.com/ruanyf/webpack-demos

## 学习到这

https://doc.webpack-china.org/guides/development/

## Topics

### HMR
https://webpack.js.org/concepts/hot-module-replacement/ \
https://webpack.js.org/guides/hot-module-replacement/ \
https://webpack.js.org/plugins/hot-module-replacement-plugin/ \
https://www.npmjs.com/package/webpack-dev-server \
https://webpack.js.org/configuration/dev-server/ \
https://github.com/webpack/webpack-dev-server

## Samples

https://github.com/vuejs/vue-router/blob/dev/examples/server.js
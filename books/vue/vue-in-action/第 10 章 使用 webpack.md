# 第 10 章 使用 `webpack`

## 10.2 `webpack` 基础配置

### 10.2.1 安装 `webpack`  与 `webpack-dev-server`

```bash
mkdir demo && cd demo

npm init -y

npm install webpack --save-dev

npm install webpack-dev-server --save-dev
```

`demo/package.json`
```json
{
  "name": "demo",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "dev": "webpack-dev-server --open --config webpack.config.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "webpack": "^3.10.0",
    "webpack-dev-server": "^2.9.7"
  }
}
```

### 10.2.2 就是一个 js 文件而已

`demo/main.js`
```js
document.getElementById('app').innerHTML = 'Hello webpack.';
```

`demo/webpack.config.js`
```js
var path = require('path');

var config = {
    entry: {
        main: './main'
    },
    output: {
        path: path.join(__dirname, './dist'),
        publicPath: '/dist/',
        filename: 'main.js'
    }
};

module.exports = config;
```

`demo/index.html`
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>webpack App</title>
</head>
<body>
    <div id="app">
        Hello World.
    </div>
    <script type="text/javascript" src="/dist/main.js"></script>
</body>
</html>
```

```bash
npm run dev
```

### 10.2.3 逐步完善配置文件

```bash
npm install css-loader --save-dev

npm install style-loader --save-dev
```

`demo/webpack.config.js`
```javas
var path = require('path');

var config = {
    entry: {
        main: './main'
    },
    output: {
        path: path.join(__dirname, './dist'),
        publicPath: '/dist/',
        filename: 'main.js'
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: [
                    'style-loader',
                    'css-loader'
                ]
            }
        ]
    }
};

module.exports = config;
```

`demo/style.css`
```css
#app {
    font-size: 24px;
    color: #f50;
}
```

`demo/main.js`
```js
import './style.css'

document.getElementById('app').innerHTML = 'Hello webpack.';
```

---

```bash
npm install extract-text-webpack-plugin --save-dev
```

`demo/webpack.config.js`
```js
var path = require('path');

var ExtractTextPlugin = require('extract-text-webpack-plugin')

var config = {
    entry: {
        main: './main'
    },
    output: {
        path: path.join(__dirname, './dist'),
        publicPath: '/dist/',
        filename: 'main.js'
    },
    module: {
        rules: [
            {
                test: /\.css$/,
                use: ExtractTextPlugin.extract({
                    use: 'css-loader',
                    fallback: 'style-loader'
                })
            }
        ]
    },
    plugins: [
        new ExtractTextPlugin('main.css')
    ]
};

module.exports = config;
```

`demo/index.html`
```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>webpack App</title>
    <link rel="stylesheet" type="text/css" href="/dist/main.css">
</head>
<body>
    <div id="app">
        Hello World.
    </div>
    <script type="text/javascript" src="/dist/main.js"></script>
</body>
</html>
```

## 10.3 单文件组件与 `vue-loader`

```bash
npm install --save vue
npm install --save-dev vue-loader
npm install --save-dev vue-style-loader
npm install --save-dev vue-template-compiler
npm install --save-dev vue-hot-reload-api
npm install --save-dev babel
npm install --save-dev babel-loader
npm install --save-dev babel-core
npm install --save-dev babel-plugin-transform-runtime
npm install --save-dev babel-preset-es2015
npm install --save-dev babel-runtime
```

`demo/webpack.config.js`
```html
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin')

var config = {
    entry: {
        main: './main'
    },
    output: {
        path: path.join(__dirname, './dist'),
        publicPath: '/dist/',
        filename: 'main.js'
    },
    module: {
        rules: [
            {
                test: /\.vue$/,
                loader: 'vue-loader',
                options: {
                    loaders: {
                        css: ExtractTextPlugin.extract({
                            use: 'css-loader',
                            fallback: 'vue-style-loader'
                        })
                    }
                }
            },
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/
            },
            {
                test: /\.css$/,
                use: ExtractTextPlugin.extract({
                    use: 'css-loader',
                    fallback: 'style-loader'
                })
            }
        ]
    },
    plugins: [
        new ExtractTextPlugin('main.css')
    ]
};

module.exports = config;
```

`demo/.babelrc`
```
{
    "presets": ["es2015"],
    "plugins": ["transform-runtime"],
    "comments": false
}
```

`demo/app.vue`
```
<template>
    <div>
        Hello {{ name }}
    </div>
</template>
<script>
    export default {
        data () {
            return {
                name: 'Vue.js'
            }
        }
    }
</script>
<style scoped>
    div {
        color: #f60;
        font-size: 60px;
    }
</style>
```

`demo/main.js`
```js
import Vue from 'vue';
import App from './app.vue';

new Vue({
    el: '#app',
    render: h => h(App)
});
```

---

`demo/title.vue`
```
<template>
    <h1>
        <a :href="'#' + title">{{ title }}</a>
    </h1>
</template>
<script>
    export default {
        props: {
            title: {
                type: String
            }
        }
    }
</script>
<style scoped>
    h1 a {
        color: #3399ff;
        font-size: 24px;
    }
</style>
```

`demo/button.vue`
```
<template>
    <button @click="handleClick" :style="styles">
        <slot></slot>
    </button>
</template>
<script>
    export default {
        props: {
            color: {
                type: String,
                default: '#00cc66'
            }
        },
        computed: {
            styles () {
                return {
                    background: this.color
                }
            }
        },
        methods: {
            handleClick (e) {
                this.$emit('click', e);
            }
        }
    }
</script>
<style scoped>
    button {
        border: 0;
        outline: none;
        color: #fff;
        padding: 4px 8px;
    }
    button:active {
        position: relative;
        top: 1px;
        left: 1px;
    }
</style>
```

`demo/app.vue`
```
<template>
    <div>
        <v-title title="Vue 组件化"></v-title>
        <v-button @click="handleClick">点击按钮</v-button>
    </div>
</template>
<script>
    import vTitle from './title.vue';
    import vButton from './button.vue';

    export default {
        components: {
            vTitle,
            vButton
        },
        methods: {
            handleClick (e) {
                console.log(e);
            }
        }
    }
</script>
<style scoped>
</style>
```
## 10.4 用于生产环境

https://github.com/icarusion/vue-book/tree/master/demo

```bash
npm install --save-dev url-loader
npm install --save-dev file-loader
```

`demo/webpack.config.js`
```js
var path = require('path');
var ExtractTextPlugin = require('extract-text-webpack-plugin')

var config = {
    entry: {
        main: './main'
    },
    output: {
        path: path.join(__dirname, './dist'),
        publicPath: '/dist/',
        filename: 'main.js'
    },
    module: {
        rules: [
            {
                test: /\.vue$/,
                loader: 'vue-loader',
                options: {
                    loaders: {
                        css: ExtractTextPlugin.extract({
                            use: 'css-loader',
                            fallback: 'vue-style-loader'
                        })
                    }
                }
            },
            {
                test: /\.js$/,
                loader: 'babel-loader',
                exclude: /node_modules/
            },
            {
                test: /\.css$/,
                use: ExtractTextPlugin.extract({
                    use: 'css-loader',
                    fallback: 'style-loader'
                })
            },
            {
                test: /\.(gif|jpg|png|woff|svg|eot|ttf)\??.*$/,
                loader: 'url-loader?limit=1024'
            }
        ]
    },
    plugins: [
        new ExtractTextPlugin('main.css')
    ]
};

module.exports = config;
```

`demo/app.vue`
```
<template>
    <div>
        <v-title title="Vue 组件化"></v-title>
        <v-button @click="handleClick">点击按钮</v-button>
        <p>
            <img src="./images/image.png" style="width: 200px;">
        </p>
    </div>
</template>
<script>
    import vTitle from './title.vue';
    import vButton from './button.vue';

    export default {
        components: {
            vTitle,
            vButton
        },
        methods: {
            handleClick (e) {
                console.log(e);
            }
        }
    }
</script>
<style scoped>
</style>
```

```bash
npm run dev
```

---

```bash
npm install --save-dev webpack-merge
npm install --save-dev html-webpack-plugin
```

`demo/webpack.prod.config.js`
```js
var webpack = require('webpack')
var HtmlWebpackPlugin = require('html-webpack-plugin')
var ExtractTextPlugin = require('extract-text-webpack-plugin')
var merge = require('webpack-merge')
var webpackBaseConfig = require('./webpack.config.js')

webpackBaseConfig.plugins = []

module.exports = merge(webpackBaseConfig, {
    output: {
        publicPath: '/dist/',
        filename: '[name].[hash].js'
    },
    plugins: [
        new ExtractTextPlugin({
            filename: '[name].[hash].css',
            allChunks: true
        }),
        new webpack.DefinePlugin({
            'process.env': {
                NODE_ENV: '"production"'
            }
        }),
        new webpack.optimize.UglifyJsPlugin({
            compress: {
                warnings: false
            }
        }),
        new HtmlWebpackPlugin({
            filename: '../index_prod.html',
            template: './index.ejs',
            inject: false
        })
    ]
})
```

`demo/index.ejs`
```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>Webpack App</title>
    <link rel="stylesheet" href="<%= htmlWebpackPlugin.files.css[0] %>">
</head>
<body>
    <div id="app"></div>
    <script type="text/javascript" src="<%= htmlWebpackPlugin.files.js[0] %>"></script>
</body>
</html> 
```

```bash
npm run build
npm run dev
```

http://localhost:8080/index_prod.html








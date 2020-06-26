# [ReactJS - Environment Setup](https://www.tutorialspoint.com/reactjs/reactjs_environment_setup.htm)

[create-react-app](https://github.com/facebookincubator/create-react-app)
```bash
npx create-react-app my-app
cd my-app
npm start
```

---

```bash
mkdir react-app && cd react-app
```

```bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm init -y
cnpm install -g babel
cnpm install -g babel-cli
cnpm install webpack --save
cnpm install webpack-dev-server --save
cnpm install react --save
cnpm install react-dom --save
cnpm install babel-core
cnpm install babel-loader
cnpm install babel-preset-react
cnpm install babel-preset-es2015
```

```bash
touch index.html
touch App.jsx
touch main.js
touch webpack.config.js
```

`./webpack.config.js`
```js
var config = {
   entry: './main.js',
   output: {
      path: '/',
      filename: 'index.js',
   },
   devServer: {
      inline: true,
      port: 8080,
   },
   module: {
      loaders: [
         {
            test: /\.jsx?$/,
            exclude: /node_modules/,
            loader: 'babel-loader',
            query: {
               presets: ['es2015', 'react']
            }
         }
      ]
   }
}

module.exports = config
```

`./package.json`
```json
{
  "name": "react-app",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "start": "webpack-dev-server --hot"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {
    "react": "^16.2.0",
    "react-dom": "^16.2.0",
    "webpack": "^3.10.0",
    "webpack-dev-server": "^2.9.7"
  }
}
```

`./index.html`
```html
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <div id="app"></div>
    <script src="index.js"></script>
</body>
</html>
```

`./App.jsx`
```js
import React from 'react'

class App extends React.Component {
    render () {
        return (
            <div>
                Hello World!!!
            </div>
        )
    }
}

export default App
```

`./main.js`
```js
import React from 'react'
import ReactDOM from 'react-dom'
import App from './App.jsx'

ReactDOM.render(
    <App />,
    document.getElementById('app')
)
```

```bash
npm start
```
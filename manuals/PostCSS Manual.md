# PostCSS Manual

http://postcss.org/

https://github.com/postcss/postcss

https://www.npmjs.com/package/postcss

https://www.postcss.parts/

## [Installation & Setup](https://github.com/postcss/postcss#usage)

### [Webpack](https://github.com/postcss/postcss#webpack)

`webpack.config.js`
```js
module.exports = {
    module: {
        rules: [
            {
                test: /\.css$/,
                exclude: /node_modules/,
                use: [
                    {
                        loader: 'style-loader',
                    },
                    {
                        loader: 'css-loader',
                        options: {
                            importLoaders: 1,
                        }
                    },
                    {
                        loader: 'postcss-loader'
                    }
                ]
            }
        ]
    }
}
```

`postcss.config.js`
```js
module.exports = {
    plugins: [
        require('precss'),
        require('autoprefixer')
    ]
}
```

## Documentation

https://github.com/postcss/postcss/tree/master/docs

## [Plugins](https://github.com/postcss/postcss/blob/master/docs/plugins.md)

https://github.com/outpunk/postcss-modules

https://github.com/postcss/autoprefixer

http://cssnext.io/

https://github.com/corysimmons/lost

http://stylelint.io/

## [Tutorials](https://github.com/postcss/postcss#articles)

http://julian.io/some-things-you-may-think-about-postcss-and-you-might-be-wrong/

https://github.com/jjaderg/awesome-postcss


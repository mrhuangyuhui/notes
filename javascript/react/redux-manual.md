# Redux Manual

https://redux.js.org/

http://cn.redux.js.org/

https://github.com/reactjs/redux

https://github.com/reactjs/react-redux

## [Installation](https://redux.js.org/#installation)

```bash
npm install --save redux

# Complementary Packages
npm install --save react-redux
npm install --save-dev redux-devtools
```

```html
<script src="https://unpkg.com/redux"></script>
```

## [The Gist](https://redux.js.org/#the-gist)

```js
import { createStore } from 'redux'

function counter(state = 0, action) {
  switch (action.type) {
  case 'INCREMENT':
    return state + 1
  case 'DECREMENT':
    return state - 1
  default:
    return state
  }
}

let store = createStore(counter)

store.subscribe(() =>
  console.log(store.getState())
)

store.dispatch({ type: 'INCREMENT' })

store.dispatch({ type: 'INCREMENT' })

store.dispatch({ type: 'DECREMENT' })
```

## [Tutorials](https://redux.js.org/docs/introduction/LearningResources.html)

[Learning Resources](https://redux.js.org/docs/introduction/LearningResources.html)

https://github.com/react-guide/redux-tutorial-cn

[Redux 入门教程（一）：基本用法](http://www.ruanyifeng.com/blog/2016/09/redux_tutorial_part_one_basic_usages.html) \
[Redux 入门教程（二）：中间件与异步操作](http://www.ruanyifeng.com/blog/2016/09/redux_tutorial_part_two_async_operations.html) \
[Redux 入门教程（三）：React-Redux 的用法](http://www.ruanyifeng.com/blog/2016/09/redux_tutorial_part_three_react-redux.html)

https://egghead.io/series/getting-started-with-redux \
https://egghead.io/courses/building-react-applications-with-idiomatic-redux

https://github.com/markerikson/react-redux-links

## Examples

https://redux.js.org/docs/introduction/Examples.html

https://github.com/reactjs/redux/tree/master/examples

**https://github.com/jackielii/simplest-redux-example**

https://github.com/xgrommx/awesome-redux

## API Reference

http://redux.js.org/docs/api/index.html

http://devdocs.io/redux/

## Tools

https://github.com/reactjs/react-redux

https://github.com/gaearon/redux-devtools

https://github.com/reduxactions/redux-actions

https://github.com/gaearon/redux-thunk

## Ecosystem

https://redux.js.org/docs/introduction/Ecosystem.html
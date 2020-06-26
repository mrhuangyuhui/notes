# [ReactJS - JSX](https://www.tutorialspoint.com/reactjs/reactjs_jsx.htm)

## Nested Elements

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>Header</h1>
        <h2>Content</h2>
        <p>This is the content!!!</p>
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## Attributes

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>Header</h1>
        <h2>Content</h2>
        <p data-myattribute="somevalue">This is the content!!!</p>
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## JavaScript Expressions

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>{6 + 2}</h1>
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    var i = 1
    return (
      <div>
        <h1>{i === 1 ? 'True' : 'False'}</h1>
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## Styling

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    var myStyle = {
      fontSize: 100,
      color: '#FF0000'
    }
    return (
      <div>
        <h1 style={myStyle}>Header</h1>
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## Comments

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>Header</h1>
        {/* Comment */}
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## Naming Convention

HTML tags always use lowercase tag names, while React components start with Uppercase.

Note − You should use `className` and `htmlFor` as XML attribute names instead of `class` and `for`.
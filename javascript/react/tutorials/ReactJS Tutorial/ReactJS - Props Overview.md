# [ReactJS - Props Overview](https://www.tutorialspoint.com/reactjs/reactjs_props_overview.htm)

## Using Props

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.header}</h1>
        <h2>{this.props.content}</h2>
      </div>
    );
  }
}

ReactDOM.render(
  <App header="Header from props..." content="Content from props..." />,
  document.getElementById('root')
);
```

## Default Props

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.header}</h1>
        <h2>{this.props.content}</h2>
      </div>
    );
  }
}

App.defaultProps = {
  header: "Header from defaultProps...",
  content: "Content from defaultProps..."
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```

## State and Props

```js
import React from 'react';
import ReactDOM from 'react-dom';

class Header extends React.Component {
  render() {
    return (
      <div>
        <h1>{this.props.header}</h1>
      </div>
    );
  }
}

class Content extends React.Component {
  render() {
    return (
      <div>
        <h2>{this.props.content}</h2>
      </div>
    );
  }
}

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      header: 'Header from state->props...',
      content: 'Content from state->props...'
    };
  }
  render() {
    return (
      <div>
        <Header header={this.state.header} />
        <Content content={this.state.content} />
      </div>
    );
  }
}

ReactDOM.render(
  <App />,
  document.getElementById('root')
);
```
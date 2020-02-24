# [ReactJS - Forms](https://www.tutorialspoint.com/reactjs/reactjs_forms.htm)

## Simple Example

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: 'Initial data...'
    };
    this.handleUpdateState = this.handleUpdateState.bind(this);
  }

  handleUpdateState(e) {
    this.setState({data: e.target.value});
  }

  render() {
    return (
      <div>
        <input type="text" value={this.state.data} onChange={this.handleUpdateState} />
        <h4>{this.state.data}</h4>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```

## Complex Example

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: 'Initial data...'
    };
    this.handleUpdateState = this.handleUpdateState.bind(this);
  }

  handleUpdateState(e) {
    this.setState({data: e.target.value});
  }

  render() {
    return (
      <div>
        <Content data={this.state.data} updateState={this.handleUpdateState} />
      </div>
    );
  }
}

class Content extends React.Component {
  render() {
    return (
      <div>
        <input type="text" value={this.props.data} onChange={this.props.updateState} />
        <h3>{this.props.data}</h3>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```
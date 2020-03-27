# [ReactJS - Events](https://www.tutorialspoint.com/reactjs/reactjs_events.htm)

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

  handleUpdateState() {
    this.setState({data: 'Data updated...'});
  }

  render() {
    return (
      <div>
        <button onClick={this.handleUpdateState}>UPDATE STATE</button>
        <h4>{this.state.data}</h4>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```

## Child Events

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

  handleUpdateState() {
    this.setState({data: 'Data updated from the child component...'});
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
        <button onClick={this.props.updateState}>UPDATE STATE</button>
        <h3>{this.props.data}</h3>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```
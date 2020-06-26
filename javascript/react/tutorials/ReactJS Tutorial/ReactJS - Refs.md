# [ReactJS - Refs](https://www.tutorialspoint.com/reactjs/reactjs_refs.htm)

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
    this.handleClearInput = this.handleClearInput.bind(this);
  }

  handleUpdateState(e) {
    this.setState({data: e.target.value});
  }

  handleClearInput() {
    this.setState({data: ''});
    ReactDOM.findDOMNode(this.refs.myInput).focus();
  }

  render() {
    return (
      <div>
        <input type="text" value={this.state.data} onChange={this.handleUpdateState} ref="myInput" />
        <button onClick={this.handleClearInput}>CLEAR</button>
        <h4>{this.state.data}</h4>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```
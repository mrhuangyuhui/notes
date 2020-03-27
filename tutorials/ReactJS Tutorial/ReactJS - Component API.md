# [ReactJS - Component API](https://www.tutorialspoint.com/reactjs/reactjs_component_api.htm)

## Set State

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor() {
    super();
    this.state = {
      data: []
    };
    this.handleSetState = this.handleSetState.bind(this);
  }

  handleSetState() {
    var item = '+item';
    var myArray = this.state.data.slice();
    myArray.push(item);
    this.setState({data: myArray});
  }

  render() {
    return (
      <div>
        <button onClick={this.handleSetState}>SET STATE</button>
        <h4>Data: {this.state.data}</h4>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```

## Force Update

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor() {
    super();
    this.handleForceUpdate = this.handleForceUpdate.bind(this);
  }

  handleForceUpdate() {
    this.forceUpdate();
  }

  render() {
    return (
      <div>
        <button onClick={this.handleForceUpdate}>FORCE UPDATE</button>
        <h4>Random Number: {Math.random()}</h4>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```

**API**

https://reactjs.org/docs/react-component.html#forceupdate

## Find Dom Node

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor() {
    super();
    this.handleFindDomNode = this.handleFindDomNode.bind(this);
  }

  handleFindDomNode() {
    var myDiv = document.getElementById('myDiv');
    ReactDOM.findDOMNode(myDiv).style.color = 'red';
  }

  render() {
    return (
      <div>
        <button onClick={this.handleFindDomNode}>FIND DOM NODE</button>
        <div id="myDiv">NODE</div>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```

**API**

https://reactjs.org/docs/react-dom.html#finddomnode
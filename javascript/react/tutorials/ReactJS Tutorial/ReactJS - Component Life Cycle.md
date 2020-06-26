# [ReactJS - Component Life Cycle](https://www.tutorialspoint.com/reactjs/reactjs_component_life_cycle.htm)

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: 0
    };
    this.handleIncrement = this.handleIncrement.bind(this);
  }

  handleIncrement() {
    this.setState({data: this.state.data + 1});
  }

  render() {
    return (
      <div>
        <button onClick={this.handleIncrement}>INCREMENT</button>
        <Content myNumber={this.state.data} />
      </div>
    );
  }
}

class Content extends React.Component {
  componentWillMount() {
    console.log('Component WILL MOUNT!');
  }

  componentDidMount() {
    console.log('Component DID MOUNT!');
  }

  componentWillReceiveProps(newProps) {
    console.log('Component WILL RECEIVE PROPS!');
  }

  shouldComponentUpdate(newProps, newState) {
    return true;
  }

  componentWillUpdate(nextProps, nextState) {
    console.log('Component WILL UPDATE!');
  }

  componentDidUpdate(prevProps, prevState) {
    console.log('Component DID UPDATE!')
  }

  componentWillUnmount(prevProps, prevState) {
    console.log('Component WILL UNMOUNT!');
  }

  render() {
    return (
      <div>
        <h3>{this.props.myNumber}</h3>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));

setTimeout(() => {ReactDOM.unmountComponentAtNode(document.getElementById('root'))}, 5000);
```
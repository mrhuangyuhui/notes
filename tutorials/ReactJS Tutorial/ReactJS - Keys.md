# [ReactJS - Keys](https://www.tutorialspoint.com/reactjs/reactjs_keys.htm)

```js
import React from 'react';
import ReactDOM from 'react-dom';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [
        {id: 1, content: 'First...'},
        {id: 2, content: 'Second...'},
        {id: 3, content: 'Third...'},
      ]
    };
  }

  render() {
    return (
      <div>
        {this.state.data.map((item, index) => <Content data={item} key={item.id} />)}
      </div>
    );
  }
}

class Content extends React.Component {
  render() {
    return (
      <div>
        <div>{this.props.data.id}/ {this.props.data.content}</div>
      </div>
    );
  }
}

ReactDOM.render(<App />, document.getElementById('root'));
```